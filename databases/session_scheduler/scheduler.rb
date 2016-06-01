#Refer to README.md in project folder for logic and business rules.

require 'time'
require 'sqlite3'
require 'faker'

user_dbname = "user.db"
user_session_dbname = "user_session.db"
# create SQLite3 database
user_db = SQLite3::Database.new(user_db_name)
user_db.results_as_hash = true

session_db = SQLite3::Database.new(user_session_dbname)
session_db.results_as_hash = true

# learn about fancy string delimiters
create_user_db = <<-SQL
  CREATE TABLE IF NOT EXISTS user(
    user_id INTEGER PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255)
  )
SQL
user_db.execute(create_user_db)

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
session_db.execute(create_session_db)

