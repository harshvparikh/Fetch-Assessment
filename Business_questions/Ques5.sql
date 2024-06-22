/* Which brand has the most spend among users who were created within the past 6 months?*/

-- Calculate the date 6 months before the max created_date once
WITH max_date AS (
    SELECT MAX(created_date) AS max_created_date
    FROM dim_users
),
cutoff_date AS (
    SELECT max_created_date - INTERVAL '6 months' AS cutoff
    FROM max_date
)

SELECT b.brand_code, SUM(fr.final_price) AS total_spent
FROM bridge_item_receipts fr
LEFT JOIN fact_receipts r ON fr.receipt_id = r.receipt_id
LEFT JOIN dim_users u ON r.user_id = u.user_id
LEFT JOIN dim_brands b ON b.brand_code = fr.brand_code
WHERE u.created_date >= (SELECT cutoff FROM cutoff_date)
  AND b.brand_code IS NOT NULL
GROUP BY b.brand_code
ORDER BY total_spent DESC
LIMIT 1;
