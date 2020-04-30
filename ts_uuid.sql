CREATE FUNCTION uuid_tstz(id text) RETURNS timestamptz AS $$
  SELECT TIMESTAMP WITH TIME ZONE 'epoch' + (((('x' || lpad(split_part(id, '-', 1), 16, '0'))::bit(64)::bigint) +
       	(('x' || lpad(split_part(id, '-', 2), 16, '0'))::bit(64)::bigint << 32)+
       	((('x' || lpad(split_part(id, '-', 3), 16, '0'))::bit(64)::bigint&4095) << 48)- 122192928000000000) / 10000000 ) * INTERVAL '1 second';
$$ LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;
