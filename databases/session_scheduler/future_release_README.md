#PURPOSE
*scheduler.rb* creates schedule preferences to coordinate pairing sessions.
Students can input their preferred days and hours for each assignment. 
The program will match students based on availability which is defined as
the time periods between "earliest" and "latest" and overlap which is the 
intersection of availability between two users.

Dates and times will be stored in UTC. When a user looks for a match it will be printed
in the preferred time zone of that user.
A function will check each new date for daylight savings time as a default unless otherwise
specified by the user.
  
#BUSINESS RULES

    Entries
  * Multiple entries can be entered since every entry will have a unique key
  * Entries can be inserted, edited and deleted
  * "latest" must be at least one hour greater than "earliest"

----
    
    Insert Rules

  * If there is no entry for that day insert entry 
  * Allow no more than two entries per day or one entry with a max availability of 12 hours
  * Specify "auto" parameter that automatically adds a 2 hour availability
    an hour before or after any existing sessions for that day.
  * see Overlap Rules when inserting entries
  * Entries with a "request" status are handled differently and override the 2 entry
    limitations. See Partnering for more details.
  *Edit Rules*
  * see Overlap Rules when editing entries
  Overlap Rules
  * Inserted or edited entry cannot overlap range of existing entry
  * If there is another entry check that both "earliest" and "latest"
    are either less than "earliest" or greater than "latest" of the other entry.

 ----

    Status

  * status defaults to "active", "inactive", "request", "booked"

----

    Matches

  * Matches will be performed where partner\_id is NULL
  * Matches occur when there is a minimum of an hour overlap between two students 
    on the same day. In other words the "earliest" of user A is at least 1 or more 
    hours less than the "latest" of user B AND "latest" of user A is at least 1 or more
    hours greater than "earliest" user B.
  * Rank matches by overlap in order from greatest to least
  * Matches returned will specify the "earliest" and "latest" availability in the overlap
----
    Partnering

  * A partner can be selected from the results of the match
  * Partner\_id cannot equal user\_id
  * A user with a "request" status can change the request to "booked".
    That has the effect of changing the remaining entries to inactive.
----
#TABLES
----

    table:
 
  *user* 

    columns:
* user\_id (primary key) 
* first\_name
* last\_name 

---
    table:

  *user\_session*

    columns:

* session\_id (primary key)
* user\_id (foreign key)
* assignment
* session_date
* day\_of\_week
* time\_zone
* earliest_ts
* latest_ts
* availability
* partner\_id
* status
----

#DATA STRUCTURES

----

* day\_ array holds the day of the week

* assignment\_hash holds week number as a key and the  assignment numbers as values


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