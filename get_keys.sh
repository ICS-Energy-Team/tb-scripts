#!/bin/bash
echo "Copying keys to $1"
psql -U thingsboard -d thingsboard -h localhost -c "\copy ts_kv_dictionary TO $1 WITH DELIMITER ';' CSV"
#psql -U thingsboard -d thingsboard -h localhost -c "\copy (SELECT K.key, K.key_id, string_agg(D_T.type, ',' ORDER BY D_T.type) FROM ts_kv_dictionary AS K JOIN (SELECT DISTINCT D.type,T.key FROM ts_kv as T JOIN device AS D ON T.entity_id=D.id) AS D_T ON D_T.key=K.key_id GROUP BY K.key) TO $1 WITH DELIMITER ';' CSV"
