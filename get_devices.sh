query="SELECT D.id, D.name, A_DN.str_v AS data_name FROM device AS D LEFT JOIN (SELECT A.str_v,A.entity_id FROM attribute_kv as A WHERE A.attribute_key='data_name') AS A_DN ON D.id=A_DN.entity_id"
psql -U thingsboard -h localhost -d thingsboard -c "\copy ($query ) TO $1 WITH DELIMITER ';' CSV HEADER"
#psql -U thingsboard -h localhost -d thingsboard -c "\copy (SELECT id,label,type,name FROM device ) TO $1 WITH DELIMITER ';' CSV HEADER"

