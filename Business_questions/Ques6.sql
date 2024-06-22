/* Which brand has the most transactions among users who were created within the past 6 months?*/ 

WITH recent_users AS (
    SELECT 
        user_id
    FROM 
        dim_users
    WHERE 
        created_date >= (SELECT MAX(created_date) - INTERVAL '6 months' FROM dim_users) /* This checkes dates from past 6 months*/
),
brand_transactions AS (
    SELECT 
        fr.brand_code,
        COUNT(fr.receipt_id) AS transaction_count
    FROM 
        bridge_item_receipts fr
    JOIN 
        fact_receipts r ON fr.receipt_id = r.receipt_id
    JOIN 
        recent_users u ON r.user_id = u.user_id
    WHERE 
        fr.brand_code IS NOT NULL
    GROUP BY 
        fr.brand_code
)
SELECT 
    brand_code,
    transaction_count
FROM 
    brand_transactions
ORDER BY 
    transaction_count DESC
	LIMIT 1;

