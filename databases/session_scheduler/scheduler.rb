#Refer to README.md in project folder for logic and business rules.

require 'time'
require 'sqlite3'
require 'faker'

# create SQLite3 database
user_db = SQLite3::Database.new("user.db")
user_db.results_as_hash = true

session = SQLite3::Database.new("session.db")
session_db.results_as_hash = true

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
  CREATE TABLE IF NOT EXISTS user(
    session_id INTEGER PRIMARY KEY,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    assignment VARCHAR(255),
    session_date DATE,
    day_of_week VARCHAR(10),
    earliest_ts DATETIME,
    latest_ts DATETIME,
    availability DATETIME,
    partner_id INT,
    status VARCHAR(255)
  )
SQL
db.execute(create_session_db)

# session\_id (primary key), user\_id (foreign key), assignment, date, day\_of\_week, time\_zone,
#earliest, latest, availability, partner\_id, status