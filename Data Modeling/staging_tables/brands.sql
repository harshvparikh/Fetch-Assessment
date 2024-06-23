CREATE TEMP TABLE raw_json (data jsonb);

/* To be run in shell:  psql -h hp -U harshparikh -d fetch_db -c "\COPY raw_json(data) FROM 'sql_scripts/brands.json'" */

CREATE TABLE brands AS
WITH json_data AS (
    SELECT jsonb_array_elements(data) AS json_obj
    FROM raw_json
)
SELECT 
   data->'_id'->>'$oid' AS brand_uuid,
    data->>'barcode' AS barcode,
    data->>'category' AS category,
    data->>'categoryCode' AS category_code,
    data->'cpg'->>'$id' AS cpg_oid,
    data->'cpg'->>'$ref' AS cpg_ref,
    data->>'name' AS name,
    (data->>'topBrand')::BOOLEAN AS top_brand,
    data->>'brandCode' AS brand_code
FROM json_data;

ALTER TABLE brands ADD PRIMARY KEY (id);

INSERT INTO brands (brand_uuid, barcode, category, category_code, cpg_oid, cpg_ref, name, top_brand, brand_code)
SELECT 
    data->'_id'->>'$oid' AS brand_uuid,
    data->>'barcode' AS barcode,
    data->>'category' AS category,
    data->>'categoryCode' AS category_code,
    data->'cpg'->'$id'->>'$oid' AS cpg_oid,
    data->'cpg'->>'$ref' AS cpg_ref,
    data->>'name' AS name,
    (data->>'topBrand')::BOOLEAN AS top_brand,
    data->>'brandCode' AS brand_code
FROM raw_json;



