#Refer to README.md in project folder for logic and business rules.

require 'time'
require 'sqlite3'
require 'faker'

assignment_hash = {
"week02" => ["2.2","2.4"],
"week03" => ["3.2","3.4"],
"week04" => ["4.3","4.6"],
"week05" => ["5.2","5.4"],
"week06" => ["6.2","6.6"],
"week07" => ["7.2"],
"week08" => ["8.2","8.4"],
"week09" => ["9.2","9.5"]
      }

session_number =  ["2.2", "2.4", "3.2", "3.4", "4.3", "4.6", "5.2", "5.4", "6.2", "6.6", "7.2", "8.2", "8.4", "9.2", "9.5"]
stan_tz = {"EST" => "-0500","CST" => "-0600","MST" => "-0700","PST" => "-0800","AKST" => "-0900","HAST" => "-1000"}
dst_tz = {"EST" => "-0400","CST" => "-0500","MST" => "-0600","PST" => "-0700","AKST" => "-0800","HAST" => "-0900"}

utc_offset = {"EST" => 5,"CST" => 6,"MST" => 7,"PST" => 8,"AKST" => 9,"HAST" => 10}
dst_offset = {"EST" => 4,"CST" => 5,"MST" => 6,"PST" => 7,"AKST" => 8,"HAST" => 9}

user_insert_string = "INSERT INTO users (first_name, last_name, user_tz) VALUES (?, ?, ?)"
session_insert_string = 
"INSERT INTO user_session 
(user_id, assignment, session_date, session_tz, earliest, latest)
VALUES (?, ?, ?, ?, ?, ?)"


# create SQLite3 database
db = SQLite3::Database.new("schedule.db")
db.results_as_hash = true


create_user_db = <<-SQL
  CREATE TABLE IF NOT EXISTS users(
    user_id INTEGER PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    user_tz VARCHAR(255)
  )
SQL
db.execute(create_user_db)

create_session_db = <<-SQL
  CREATE TABLE IF NOT EXISTS user_session(
    user_id INT,
    sess_num VARCHAR(255),
    session_date DATE,
    session_tz VARCHAR(255),
    earliest DATETIME,
    latest DATETIME,
    partner_id INT DEFAULT NULL,
    status VARCHAR(255) DEFAULT "Active",
    PRIMARY KEY (user_id, session_date, partner_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id)
  )
SQL
db.execute(create_session_db)

#To add days or weeks to a Time object, the seconds
#must be calculated and added back. A day in seconds
#is equal to 24 * 60 * 60 (hours * minutes * seconds)
#the days parameter will multiple by the amount of days
#provided and weeks is the same factor times 7 times
#the amount of weeks specified
def add_days(week, days)
  day_in_seconds = 86400 # 24 * 60 * 60
  day_sum = days * day_in_seconds
  week_sum = 7 * day_in_seconds * week
  total_days = day_sum + week_sum
end

def insert_into_table(db, query_string, *args)
  db.execute(query_string, args)
end

=begin
10.times do
#  insert_into_table(db, user_insert_string, Faker::Name.first_name, Faker::Name.last_name, stan_tz[rand(6)]) 
  insert_into_table(db, user_insert_string, Faker::Name.first_name, Faker::Name.last_name, stan_tz.keys[rand(stan_tz.length)]) 
end
=end

user_recs = db.execute("select * from users")
# increment week as follows time_val + (7*24*60*60)

comp_week = ""
pref_date = Time.utc(2016,4,11)
session_number.each do |sess|
  user_recs.each do |id|
    #3.times do
      ##puts "assignment #{sess} for user #{id['user_id']} and tz #{stan_tz[id['user_tz']]}"
      
      sess_date = pref_date + add_days(0,rand(3))
      ##puts "sess date is #{sess_date}"
      ##puts "original date is #{pref_date}"
      #check dst
      utc_adjust = pref_date.dst? ? dst_offset[id['user_tz']] : utc_offset[id['user_tz']]
      #utc adjust adds the hours back to get to utc.
      early = rand(10) + utc_adjust
      late = early + 2 + rand(4)
      puts "#{id['user_id']} | #{sess} | #{sess_date} | #{stan_tz[id['user_tz']]} | #{early} | #{late}"
      #p pref_date
    #end
    p ""
  end
  sess_week = sess.split(".")[0]
  if sess_week != comp_week
    pref_date = pref_date + add_days(1,0)
    comp_week = sess_week
  end
end
=begin
  user_id, x
  sess_num, x
  session_date, declared above and incremented in loop
  session_tz, retrieved from query and look up
  earliest, x
  latest)x
=end


#insert_into_table(db,session_insert_string, )
=begin
calculate a seed date
for each session number
  for each user id 3 times (representing a day)
    for each day set earliest and latest
    update user session
=end