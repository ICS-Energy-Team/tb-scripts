#!/bin/bash
#Usage
#./del_event.sh '2020-04-01 00:00' '2020-04-02 15:10:30'
echo "Deleting events after $1 and before $2"
psql -U thingsboard -d thingsboard -h localhost -c "DELETE FROM event WHERE uuid_tstz(event_uid)>='$1' AND uuid_tstz(event_uid)<'$2';" 
echo "Event deleted"
