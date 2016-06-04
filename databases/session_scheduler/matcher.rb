=begin
matcher.rb
1. retrieves all records for a single user from the user_schedule table
2. searches for other users in user_schedule that have the same date, session_number
3. matches records where there is an overlap of at least 1 hour

Note: 
The fields earliest and latest are integers that represent 1 hour in a 24 hour period in UTC.
Later versions will convert the hours to the user's local time.
=end
require 'sqlite3'
require 'time'


db = SQLite3::Database.new("schedule.db")
db.results_as_hash = true

def record_exists?(db, table_name, col_name, table_value)
  #puts "tname #{table_name} col #{col_name} val #{table_value}"
  result = db.execute("select * from #{table_name} where #{col_name} = '#{table_value}'")
  
  if result.length == 0
    return false
  else
    return true
  end
end

def user_date_exists?(db, user_id, lookup_date)
  #puts "tname #{table_name} col #{col_name} val #{table_value}"
  result = db.execute("select * from user_schedule where user_id = '#{user_id}' and session_date = '#{lookup_date}'")
  
  if result.length == 0
    return false
  else
    return true
  end
end

#checks that dates have correct values and format
#valid_date_format? checks that input dates are valid numbers
#that form a proper date
def valid_date_format?(test_date)
  date_arr = test_date.split("-")
  #check for non numeric values
  date_arr.each do |d|
    if d =~ /\D/
      return false
    end
  end
      
  #confirm that each date parameter has been sent
  if date_arr.length != 3
    return false
  else
    date_arr.map! {|d| d.to_i }
  end
  
  year, month, day = date_arr
  
  #Test that numeric values are valid. The Time class
  #will be able to validate the values.
  begin
    check_date = Time.local(year,month,day)
  rescue
    return false
  else
    return true
  end
  
end

def find_match(db, search_date, user)
  query_string = 
  "select s1.session_date, s1.session_id, 
    u1.first_name || ' ' || u1.last_name name1, s1.user_id id1, s1.session_tz tz1, s1.earliest early1, s1.latest latest1, 
    u2.first_name || ' ' || u2.last_name name2, s2.user_id id2, s2.session_tz tz2, s2.earliest early2, s2.latest latest2
    from user_schedule s1,
         user_schedule s2,
         users u1,
         users u2
    where s1.session_date = s2.session_date
       and s1.session_date = '#{search_date}'
       and s1.session_id = s2.session_id
       and s1.user_id = #{user}
       and s2.user_id <> s1.user_id
       and s1.user_id = u1.user_id
       and s2.user_id = u2.user_id
       and s1.partner_id is NULL
       and s2.partner_id is NULL"
    
  match_recs = db.execute(query_string)
  
  if match_recs.length == 0
    Kernel.abort("No matches found for this user for this day. Exiting program")
  end  
  return match_recs
end

def convert_to_display_time(time_int)
  if time_int > 9
    return "#{time_int.to_s}:00"
  else
    return "0#{time_int.to_s}:00"
  end
end

#calculate_overlap looks for a minimum of 1 hour 
def calculate_overlap(early1, early2, latest1, latest2)
  hours = Time.now
  max_early =  early1 > early2 ? early1 : early2
  min_latest = latest1 < latest2 ? latest1 : latest2
  if (min_latest - max_early) >= 1
    from_time = convert_to_display_time(max_early)
    to_time = convert_to_display_time(min_latest)
    return from_time, to_time
  else
    return nil
  end
end



def print_users(user_list)
  puts "Current User Info"
  user_list.each do |item |
    puts "#{item['user_id']}: #{item['first_name']} #{item['last_name']}"
  end
end

def print_dates(user_dates)
  puts "User is available for pairing on the following dates:"
  user_dates.each do |date|
    puts "#{date['session_date']} for assignment #{date['session_id']}"
  end
end

valid_id = false
user_list =  db.execute("SELECT * FROM users where user_id ")

while !valid_id
  puts ""
  print_users(user_list)
  puts "Please select the user id from the list above of the user you want to look up:"
  id_num = gets.chomp
    if (id_num =~ /[1-9]/) 
      id_num = id_num.to_i
      if record_exists?(db, "'users'", "user_id", id_num)
      #if record_exists?(db, "'users'", id_num)
        valid_id = true
      else
        puts "User id does not exist please select from the list below."
        puts ""
      end
    else
      puts "Please enter a valid integer starting with 1 or higher"
      puts ""
    end
end

#Kernel.abort("No matches found for this user for this day. Exiting program")
user_dates = db.execute("select session_id, session_date from user_schedule where user_id = #{id_num}")

#receive input
#split it into 3 array items
#check length and proper dates
valid_date = false
print_dates(user_dates)
while !valid_date
  puts ""
  puts "Please select a date from the list above. Format must be YYYY-MM-DD for example 2001-10-02"
  puts ""
  #print_dates(user_dates)
  search_date = gets.chomp

  if valid_date_format?(search_date)
    if user_date_exists?(db, id_num, search_date)
      valid_date = true
    else
      puts "Date not found. Please select a date from the list below."
      puts ""
    end
  else
    puts "Invalid date. Please enter a date in the valid format"
    puts ""
  end
end


paired_match = []
matches = find_match(db, search_date, id_num)

#puts matches[0]['name1']
puts ""
match_count = 0
matches.each do |row|
  overlap = calculate_overlap(row["early1"],row["early2"],row["latest1"],row["latest2"])
  if overlap
    if match_count == 0
      puts "#{matches[0]['name1']} can work on assignment #{matches[0]['session_id']} with the following students: "
      puts ""
    end
    #puts "#{row['name1']} can work on assignment #{row['session_id']} with #{row['name2']} on #{row['session_date']} from #{overlap[0]} to #{overlap[1]} UTC"
    puts "select one --> #{row['id2']} <-- #{row['name2']} on #{row['session_date']} from #{overlap[0]} to #{overlap[1]} UTC"
    paired_match << row['id2']
    match_count +=1
  end
  if match_count == 0
    Kernel.abort("No matches found for this user for this day. Exiting program")
  end
end

puts paired_match



valid_partner = false

#steps to update status
# 1. retrieve partner id
# 2. update user_schedule for both ids
# 3. retrieve records
# 4. print message that says name1 has paired with name 2 on assignment (session id)

while !valid_partner
  puts ""
  puts "Please select the user id of the person to paired"
  partner = gets.chomp.to_i
  if paired_match.include?(partner)
    #once a pair is selected, copy find match code and retrieve and print records
    #with changed status
    puts "The number is #{partner}"
    valid_partner = true
  else
    puts "user id not found please select from the list below"
    puts ""
    puts paired_match
    puts ""
  end
end

