=begin
matcher.rb
1. retrieves all records for a single user from the user_session table
2. searches for other users in user_session that have the same date, session_number
3. matches records where there is an overlap of at least 2 hours
=end
require 'sqlite3'


db = SQLite3::Database.new("schedule.db")
db.results_as_hash = true



def find_match(db, search_date, user)
  query_string = 
  ("select u1.session_date, u1.sess_num, 
    u1.user_id id1, u1.session_tz tz1, u1.earliest early1, u1.latest latest1, 
    u2.user_id id2, u2.session_tz tz2, u2.earliest early2, u2.latest latest2
    from user_session u1,
         user_session u2
    where u1.session_date = u2.session_date
       and u1.session_date = #{search_date}
       and u1.sess_num = u2.sess_num
       and u1.user_id = #{user}
       and u2.user_id <> u1.user_id
       and u1.partner_id is NULL
       and u2.partner_id is NULL"
    )
  match_recs = db.execute(query_string)  
end

def calculate_overlap(early1, early2, latest1, latest2)
  max_early =  early1 > early2 ? early1 : early2
  min_latest = latest1 < latest2 ? latest1 : latest2
end

session_date = "'2016-06-09'"

user_number = 13

matches = find_match(db, session_date,user_number)
matches.each do |row|
  puts "early 1 #{row["early1"]} early 2 #{row["early2"]}"
end

#session_recs = db.execute("select * from user_session where user_id = #{user_number} and partner_id is NULL")

#p session_recs
#session_recs.each do |row|
#  row.each {|col| puts "#{col} is a(n) #{col.class}"} 
#end

#session_recs.each {|row| puts row}
#uts session_recs[0][1]
