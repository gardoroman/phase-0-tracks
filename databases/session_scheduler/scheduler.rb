#Refer to README.md in project folder for logic and business rules.

require 'time'
require 'sqlite3'
require 'faker'

user_insert_string = "INSERT INTO user (first_name, last_name) VALUES (?, ?)"
session_insert_string = 
"INSERT INTO user_session 
(user_id, assignment, session_date,
 day_of_week, session_tz, earliest_ts
 latest_ts, availability, status)
VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"


#user_session_dbname = "user_session.db"
# create SQLite3 database
db = SQLite3::Database.new("schedule.db")
db.results_as_hash = true

# learn about fancy string delimiters
create_user_db = <<-SQL
  CREATE TABLE IF NOT EXISTS user(
    user_id INTEGER PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255)
  )
SQL
db.execute(create_user_db)

create_session_db = <<-SQL
  CREATE TABLE IF NOT EXISTS user_session(
    session_id INTEGER PRIMARY KEY,
    user_id INT,
    assignment VARCHAR(255),
    session_date DATE,
    day_of_week VARCHAR(10),
    session_tz VARCHAR(255),
    earliest_ts DATETIME,
    latest_ts DATETIME,
    availability DATETIME,
    partner_id INT DEFAULT NULL,
    status VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES user(user_id)
  )
SQL
db.execute(create_session_db)


def insert_into_table(db, query_string, *args)
  db.execute(query_string, args)
end

50.times do
  insert_into_table(db, user_insert_string, Faker::Name.first_name, Faker::Name.last_name)
  #create_kitten(db, Faker::Name.name, Date.birthday(0,2))
end

