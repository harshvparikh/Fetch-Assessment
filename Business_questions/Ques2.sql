/* How does the ranking of the top 5 brands by receipts scanned for the recent month compare to the ranking for the previous month?*/ 

WITH current_month AS (
    SELECT DATE_TRUNC('month', MAX(date_scanned)) AS current_month
    FROM fact_receipts
),
month_before AS (
    SELECT current_month - INTERVAL '2 month' AS month_before
    FROM current_month     /* This condition checks it for the previous month using Interval*/ 
) 

SELECT 
        fr.brand_code as Brand, 
        COUNT(fr.receipt_id) AS receipts_scanned
    FROM 
        bridge_item_receipts fr
    LEFT JOIN 
        fact_receipts r ON fr.receipt_id = r.receipt_id
    WHERE 
        fr.brand_code IS NOT NULL 
		and DATE_TRUNC('month', date_scanned) = (select * from month_before)
    GROUP BY 
        fr.brand_code
		ORDER BY receipts_scanned desc
		LIMIT 5;
		
