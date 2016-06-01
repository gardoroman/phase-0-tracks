=begin
Purpose
scheduler.rb creates schedule preferences to coordinate pairing sessions.
Students can input their preferred days and hours for each assignment.
Dates and times will be stored in UTC. If the requested time zone of both
students match, that time zone will be printed, otherwise, both time zones
will be matched.
Each new date will be checked for daylight savings time and adjusted accordingly.

Tables
table: user 
columns: user_id (primary key) | first_name | last_name |
table: user_session 
columns: session_id (primary key) | user_id (foreign key) | date | day_of_week | time_zone | assignment | earliest | latest  | session_booked | 

Data Structures
day array holds the day of the week
assignment hash holds week number as a key and the assignment numbers as values

Open Ideas
- Rank matches by the amount of 
- Method of inputting sessions is still undecided. Perhaps a student prefers day of week to an actual date

Current Release
- Assumes the stand times zones: Easter, Central, Mountain, Pacific, Alaska, and Hawaii-Aleutian.


Future Releases
- Create a file to read in assignments as opposed to hard coding hash values.
- Open timezone offsets to any region. Create database lookup timezones and countries.
- Once a match has been accepted any open sessions for that assignment will
  be removed.
=end