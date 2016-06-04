#PURPOSE
This project contains programs to create and maintain user schedules.

*scheduler.rb* test data to simulate students adding their availability for 
pairing sessions.

*matcher.rb* allows a user to select their id from a list of users and
find other students whose availability overlaps with the user's availability

  
#BUSINESS RULES
  
  * Users are allowed one entry per assignment, per day
  * A user's preferred time zone must be recorded
  * All times are set to UTC to facilitate matching

----

    Status

  * status defaults to "active", "booked"

----

    Matches

  * Matches will be performed where partner\_id is NULL
  * Matches occur when there is a minimum of an hour overlap between the
    availability of two students

----
    Partnering
  * A partner can be selected from the results of the match
  * Partner\_id cannot equal user\_id
  * Once a user chooses to pair with another user, their status will change
    from "active" to "booked"
----
#TABLES
----

    table:
 
  *user* 

    columns:
* user\_id (primary key) 
* first\_name
* last\_name 
* user\_tz

---
    table:

  *user\_session*

    columns:

* user\_id (foreign key)
* session\_id (primary key)
* assignment
* session_date
* earliest
* latest
* partner\_id
* status
----

#OPEN ISSUES

  * placeholder


#CURRENT RELEASE

* Assumes the stand times zones: Easter, Central, Mountain, Pacific, Alaska, and Hawaii*Aleutian.



#FUTURE RELEASES
----
* Create a file to read in assignments as opposed to hard coding hash values.
* Open timezone offsets to any region. Create database lookup for timezones and countries.
* Once a match has been accepted any open sessions for that assignment will
  be removed.