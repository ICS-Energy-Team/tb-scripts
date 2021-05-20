psql -U thingsboard -h localhost -d thingsboard -c "\copy (SELECT id,label,type,name FROM device ) TO $1 WITH DELIMITER ';' CSV HEADER"
