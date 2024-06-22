/* As there is no Accepted status in the data, I assumed that Finished is accepted*/

WITH accepted_items AS (
    SELECT SUM(total_items) AS total_accepted_items
    FROM public.fact_receipts
    WHERE rewards_receipt_status = 'FINISHED'
),
rejected_items AS (
    SELECT SUM(total_items) AS total_rejected_items
    FROM public.fact_receipts
    WHERE rewards_receipt_status = 'REJECTED'
)
SELECT
    'Accepted' AS receipt_status,
    total_accepted_items AS total_items
FROM
    accepted_items
UNION ALL
SELECT
    'Rejected' AS receipt_status,
    total_rejected_items AS total_items
FROM
    rejected_items;
