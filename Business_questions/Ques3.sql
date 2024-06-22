/*When considering average spend from receipts with 'rewardsReceiptStatus’ of ‘Accepted’ or ‘Rejected’, which is greater?*/

/* As there is no Accepted status in the data, I took that Finished is accepted
I checked different status from the query below: 

SELECT * from fact_receipts; 
SELECT distinct(rewards_receipt_status)
FROM public.fact_receipts;
*/

WITH accepted_receipts AS (
    SELECT total_spent
    FROM public.fact_receipts
    WHERE rewards_receipt_status = 'FINISHED'
),
rejected_receipts AS (
    SELECT total_spent
    FROM public.fact_receipts
    WHERE rewards_receipt_status = 'REJECTED'
)
SELECT
    'Accepted' AS receipt_status,
    AVG(total_spent) AS avg_spend
FROM
    accepted_receipts
UNION ALL
SELECT
    'Rejected' AS receipt_status,
    AVG(total_spent) AS avg_spend
FROM
    rejected_receipts;


