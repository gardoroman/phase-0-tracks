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

#for formatting
SPACES = " "

db = SQLite3::Database.new("schedule.db")
db.results_as_hash = true

#Checks that the user entered a valid user id number
def user_exists?(db, id_num)
  result = db.execute("select * from users where user_id = ?", [id_num])
  
  #if there are no matches the user enter an incorrect id value for the user_id    
  if result.length == 0
    return false
  else
    return true
  end
end

#Checks that user entered a valid date for the selected user id
def date_exists?(db, user_id, lookup_date)
  result = db.execute("select * from user_schedule where user_id = ? and session_date = ?", [user_id, lookup_date])

  #if there are no matches the user enter an incorrect date value for the user_id
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
    Kernel.abort("Session has been booked or does not exist for this user for this day. Exiting program")
  end  
  return match_recs
end

def update_session(db, p_id, status_type, u_id, session_date, session_id )
  #query_string = "update user_schedule set partner_id = ?, status = ? where user_id = ? and session_date = ? and session_id = ?"
  db.execute("update user_schedule set partner_id = ?, status = ? where user_id = ? and session_date = ? and session_id = ?", [p_id,status_type,u_id, session_date,session_id])
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
      if user_exists?(db, id_num)
      #if user_exists?(db, "'users'", id_num)
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
    if date_exists?(db, id_num, search_date)
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


paired_id = []
paired_info = []
user_name = ''
matches = find_match(db, search_date, id_num)

#puts matches[0]['name1']
puts ""
match_count = 0
matches.each do |row|
  overlap = calculate_overlap(row["early1"],row["early2"],row["latest1"],row["latest2"])                
  header = "User ID  | Partner Name (first 30 chars) | Date       | From (UTC) | To (UTC)" 
  if overlap
    if match_count == 0
      puts ""
      puts "#{matches[0]['name1']} can work on assignment #{matches[0]['session_id']} with the following students: "
      user_name = matches[0]['name1']
      puts header
    end
    id2 = row['id2'].to_s
    name2 = row['name2'].slice(0..29)
    s_date = row['session_date']
    to_date = overlap[0]
    from_date = overlap[1]
    #puts "select one --> #{row['id2']} <-- #{row['name2']} on #{row['session_date']} from #{overlap[0]} to #{overlap[1]} UTC"
    #puts "#{id2}#{SPACES * (10-id2.length)}#{name2}#{SPACES * (31-name2.length)}"
    print "#{id2}#{SPACES * (11-id2.length)}#{name2}#{SPACES * (32-name2.length)}#{s_date}#{SPACES * (13-s_date.length)}"
    puts "#{to_date}#{SPACES * (13-to_date.length)}#{from_date}"
    #paired_info.push(row['id2'], row['name2'], row['session_date'], row['session_id'], overlap[0], overlap[1])
    paired_info << row
    paired_id << row['id2']
    match_count +=1
  end
  if match_count == 0
    Kernel.abort("No matches found for this user for this day. Exiting program")
  end
end


valid_partner = false

#steps to update status
# 1. retrieve partner id
# 2. update user_schedule for both ids
# 3. retrieve records
# 4. print message that says name1 has paired with name 2 on assignment (session id)

partner_info = []
while !valid_partner
  puts ""
  puts "Please select the user id of the person to paired"
  #p paired_id
  partner = gets.chomp.to_i
  if paired_id.include?(partner)
    #once a pair is selected, copy find match code and retrieve and print records
    #with changed status
    valid_partner = true
    partner_info = paired_info.find_all do |rec|
      rec['id2'] == partner
    end
  else
    puts "user id not found please select from the user ids above"
    puts ""
  end
end

user_name1 = partner_info[0]['name1']
user_name2 = partner_info[0]['name2']
uid_1 = partner_info[0]['id1']
uid_2 = partner_info[0]['id2']
sess_date = partner_info[0]['session_date']
sess_id = partner_info[0]['session_id']

sess_status = "Booked"



#update status of the user
update_session(db,uid_1, "Booked", uid_2, sess_date, sess_id)

#update the state of the partner
update_session(db,uid_2, "Booked", uid_1, sess_date, sess_id)

puts ""
puts "Session for assignment #{sess_id} has been booked on #{sess_date} for #{user_name1} and #{user_name2}"
puts ""
puts "Goodbye!"