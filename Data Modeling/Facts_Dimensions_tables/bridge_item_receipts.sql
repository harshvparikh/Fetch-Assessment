-- Create bridge_item_receipts table
CREATE TABLE bridge_item_receipts (
    item_receipt_id SERIAL PRIMARY KEY,
    receipt_id VARCHAR(255),
    barcode VARCHAR(255),
    brand_code VARCHAR(255),
    description TEXT,
	rewards_product_partner_id VARCHAR(255),
	partner_item_id VARCHAR(255),
    quantity_purchased INT,
    item_price DECIMAL(10, 2),
    discounted_item_price DECIMAL(10, 2),
    final_price DECIMAL(10, 2),
    points_earned INT
);

-- Indexes for bridge_item_receipts
CREATE INDEX idx_bridge_item_receipts_receipt_id ON bridge_item_receipts(receipt_id);
CREATE INDEX idx_bridge_item_receipts_brand_code ON bridge_item_receipts(rewards_product_partner_id);

INSERT INTO bridge_item_receipts (receipt_id, barcode, brand_code, description, rewards_product_partner_id, 
	partner_item_id, quantity_purchased, item_price, discounted_item_price, final_price, points_earned)
SELECT 
    receipt_oid AS receipt_id, 
    barcode, 
    brand_code, 
    description,
	rewards_product_partner_id,
	partner_item_id,
    quantity_purchased, 
    item_price, 
    discounted_item_price, 
    final_price, 
    points_earned
FROM item_receipts
