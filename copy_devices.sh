#!/bin/bash
psql -U thingsboard -h localhost -d thingsboard -c "\copy (SELECT D.id,D.label,D.type,D.name,A_S.str_v AS data_name FROM device AS D LEFT JOIN (SELECT A.entity_id,A.str_v FROM attribute_kv AS A WHERE A.attribute_key='data_name') AS A_S ON D.id=A_S.entity_id) TO $1 WITH DELIMITER ';' CSV HEADER"

