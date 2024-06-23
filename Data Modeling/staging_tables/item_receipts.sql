
CREATE TEMP TABLE item_receipts_raw_json (data jsonb);

/* To be run in shell:  psql -h hp -U harshparikh -d fetch_db -c "\COPY item_receipts_raw_json(data) FROM 'sql_scripts/item_receipts.json'" */

CREATE TABLE item_receipts AS
WITH json_data AS (
    SELECT jsonb_array_elements(data) AS json_obj
    FROM item_receipts_raw_json
)
SELECT 
    receipt_oid,
    item->>'barcode' AS barcode,
    item->>'brandCode' AS brand_code,
    item->>'competitorRewardsGroup' AS competitor_rewards_group,
    item->>'description' AS description,
    (item->>'discountedItemPrice')::DECIMAL AS discounted_item_price,
    (item->>'finalPrice')::DECIMAL AS final_price,
    item->>'itemNumber' AS item_number,
    (item->>'itemPrice')::DECIMAL AS item_price,
    (item->>'needsFetchReview')::BOOLEAN AS needs_fetch_review,
    item->>'needsFetchReviewReason' AS needs_fetch_review_reason,
    (item->>'originalFinalPrice')::DECIMAL AS original_final_price,
    item->>'originalMetaBriteBarcode' AS original_meta_brite_barcode,
    item->>'originalMetaBriteDescription' AS original_meta_brite_description,
    (item->>'originalMetaBriteItemPrice')::DECIMAL AS original_meta_brite_item_price,
    (item->>'originalMetaBriteQuantityPurchased')::INT AS original_meta_brite_quantity_purchased,
    item->>'partnerItemId' AS partner_item_id,
    (item->>'pointsEarned')::DECIMAL AS points_earned,
    item->>'pointsNotAwardedReason' AS points_not_awarded_reason,
    item->>'pointsPayerId' AS points_payer_id,
    (item->>'preventTargetGapPoints')::BOOLEAN AS prevent_target_gap_points,
    (item->>'quantityPurchased')::INT AS quantity_purchased,
    item->>'rewardsGroup' AS rewards_group,
    item->>'rewardsProductPartnerId' AS rewards_product_partner_id,
    (item->>'targetPrice')::DECIMAL AS target_price,
    item->>'userFlaggedBarcode' AS user_flagged_barcode,
    item->>'userFlaggedDescription' AS user_flagged_description,
    (item->>'userFlaggedNewItem')::BOOLEAN AS user_flagged_new_item,
    (item->>'userFlaggedPrice')::DECIMAL AS user_flagged_price,
    (item->>'userFlaggedQuantity')::INT AS user_flagged_quantity
FROM item_receipts_raw_json;

INSERT INTO item_receipts (
    receipt_oid, barcode, brand_code, competitor_rewards_group, description, discounted_item_price, final_price, 
    item_number, item_price, needs_fetch_review, needs_fetch_review_reason, original_final_price, 
    original_meta_brite_barcode, original_meta_brite_description, original_meta_brite_item_price, 
    original_meta_brite_quantity_purchased, partner_item_id, points_earned, points_not_awarded_reason, points_payer_id, 
    prevent_target_gap_points, quantity_purchased, rewards_group, rewards_product_partner_id, target_price, 
    user_flagged_barcode, user_flagged_description, user_flagged_new_item, user_flagged_price, user_flagged_quantity
)
SELECT 
    receipt_oid,
    item->>'barcode' AS barcode,
    item->>'brandCode' AS brand_code,
    item->>'competitorRewardsGroup' AS competitor_rewards_group,
    item->>'description' AS description,
    (item->>'discountedItemPrice')::DECIMAL AS discounted_item_price,
    (item->>'finalPrice')::DECIMAL AS final_price,
    item->>'itemNumber' AS item_number,
    (item->>'itemPrice')::DECIMAL AS item_price,
    (item->>'needsFetchReview')::BOOLEAN AS needs_fetch_review,
    item->>'needsFetchReviewReason' AS needs_fetch_review_reason,
    (item->>'originalFinalPrice')::DECIMAL AS original_final_price,
    item->>'originalMetaBriteBarcode' AS original_meta_brite_barcode,
    item->>'originalMetaBriteDescription' AS original_meta_brite_description,
    (item->>'originalMetaBriteItemPrice')::DECIMAL AS original_meta_brite_item_price,
    (item->>'originalMetaBriteQuantityPurchased')::INT AS original_meta_brite_quantity_purchased,
    item->>'partnerItemId' AS partner_item_id,
    (item->>'pointsEarned')::DECIMAL AS points_earned,
    item->>'pointsNotAwardedReason' AS points_not_awarded_reason,
    item->>'pointsPayerId' AS points_payer_id,
    (item->>'preventTargetGapPoints')::BOOLEAN AS prevent_target_gap_points,
    (item->>'quantityPurchased')::INT AS quantity_purchased,
    item->>'rewardsGroup' AS rewards_group,
    item->>'rewardsProductPartnerId' AS rewards_product_partner_id,
    (item->>'targetPrice')::DECIMAL AS target_price,
    item->>'userFlaggedBarcode' AS user_flagged_barcode,
    item->>'userFlaggedDescription' AS user_flagged_description,
    (item->>'userFlaggedNewItem')::BOOLEAN AS user_flagged_new_item,
    (item->>'userFlaggedPrice')::DECIMAL AS user_flagged_price,
    (item->>'userFlaggedQuantity')::INT AS user_flagged_quantity
FROM item_receipts_raw_json;

