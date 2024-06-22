/* What are the top 5 brands by receipts scanned for most recent month? */

WITH current_month AS (
    SELECT DATE_TRUNC('month', MAX(date_scanned)) AS current_month
    FROM fact_receipts
),
recent_month AS (
    SELECT current_month - INTERVAL '1 month' AS recent_month
    FROM current_month
)

SELECT 
        fr.brand_code as Brand, /* I used brand_code to identify brands as it had more distinct values to identify a brand*/
        COUNT(fr.receipt_id) AS receipts_scanned
    FROM 
        bridge_item_receipts fr
    LEFT JOIN 
        fact_receipts r ON fr.receipt_id = r.receipt_id
    WHERE 
        fr.brand_code IS NOT NULL 
		and DATE_TRUNC('month', date_scanned) = (select * from recent_month)
    GROUP BY 
        fr.brand_code
		ORDER BY receipts_scanned desc
		LIMIT 5;
		
