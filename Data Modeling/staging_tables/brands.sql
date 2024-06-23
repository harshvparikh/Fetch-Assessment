CREATE TEMP TABLE raw_json (data jsonb);

/* To be run in shell:  psql -h hp -U harshparikh -d fetch_db -c "\COPY raw_json(data) FROM 'sql_scripts/brands.json'" */

CREATE TABLE brands AS
WITH json_data AS (
    SELECT jsonb_array_elements(data) AS json_obj
    FROM raw_json
)
SELECT 
    json_obj -> '_id' ->> '$oid' AS id,
    (json_obj -> 'active')::text AS active,
    TO_TIMESTAMP((json_obj -> 'createdDate' ->> '$date')::bigint / 1000) AS created_date,
    TO_TIMESTAMP((json_obj -> 'lastLogin' ->> '$date')::bigint / 1000) AS last_login,
    (json_obj ->> 'role')::text AS role,
    (json_obj ->> 'signUpSource')::text AS sign_up_source,
    (json_obj ->> 'state')::text AS state
FROM json_data;

ALTER TABLE brands ADD PRIMARY KEY (id);


