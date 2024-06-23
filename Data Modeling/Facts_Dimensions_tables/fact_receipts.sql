-- Create fact_receipts table
CREATE TABLE fact_receipts (
    receipt_id VARCHAR PRIMARY KEY,
    user_id VARCHAR(255),
	bonus_points_earned_reason VARCHAR(255),
    date_scanned TIMESTAMP,
	purchase_date TIMESTAMP, 
    rewards_receipt_status VARCHAR(255),
	bonus_points_earned INT,
    total_spent DECIMAL(10, 2),
    total_items INT,
    points_earned INT,
	purchased_item_count INT
);

-- Indexes for fact_receipts
CREATE INDEX idx_fact_receipts_user_id ON fact_receipts(user_id);
CREATE INDEX idx_fact_receipts_date_scanned ON fact_receipts(date_scanned);

-- Populate fact_receipts table
INSERT INTO fact_receipts (receipt_id, user_id, bonus_points_earned_reason, date_scanned, purchase_date, rewards_receipt_status, bonus_points_earned, total_spent, total_items, points_earned, purchased_item_count)
SELECT 
    oid AS receipt_id, 
    user_id, 
	bonus_points_earned_reason,
	date_scanned,
    purchase_date, 
    rewards_receipt_status, 
	bonus_points_earned,
    total_spent, 
     purchased_item_count as total_items, 
    points_earned, 
    purchased_item_count
FROM receipts;
