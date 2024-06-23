

CREATE TEMP TABLE receipts_raw_json (data jsonb);

/* To be run in shell:  psql -h hp -U harshparikh -d fetch_db -c "\COPY receipts_raw_json(data) FROM 'sql_scripts/receipts.json'" */

CREATE TABLE receipts AS
WITH json_data AS (
    SELECT jsonb_array_elements(data) AS json_obj
    FROM receipts_raw_json
)
SELECT 
    data->'_id'->>'$oid' AS oid,
    (data->>'bonusPointsEarned')::INT AS bonus_points_earned,
    data->>'bonusPointsEarnedReason' AS bonus_points_earned_reason,
    to_timestamp((data->'createDate'->>'$date')::BIGINT / 1000) AS create_date,
    to_timestamp((data->'dateScanned'->>'$date')::BIGINT / 1000) AS date_scanned,
    to_timestamp((data->'finishedDate'->>'$date')::BIGINT / 1000) AS finished_date,
    to_timestamp((data->'modifyDate'->>'$date')::BIGINT / 1000) AS modify_date,
    to_timestamp((data->'pointsAwardedDate'->>'$date')::BIGINT / 1000) AS points_awarded_date,
    (data->>'pointsEarned')::DECIMAL AS points_earned,
    to_timestamp((data->'purchaseDate'->>'$date')::BIGINT / 1000) AS purchase_date,
    (data->>'purchasedItemCount')::INT AS purchased_item_count,
    data->>'rewardsReceiptStatus' AS rewards_receipt_status,
    (data->>'totalSpent')::DECIMAL AS total_spent,
    data->>'userId' AS user_id
FROM receipts_raw_json;
