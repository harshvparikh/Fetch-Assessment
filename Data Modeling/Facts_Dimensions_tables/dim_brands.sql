CREATE TABLE dim_brands (
    brand_id VARCHAR PRIMARY KEY,
	barcode VARCHAR(20),
	cpg_id VARCHAR(255),
	top_brand BOOLEAN,
    brand_name VARCHAR(255),
    category VARCHAR(255),
    category_code VARCHAR(255),
	brand_code VARCHAR(255)
);

-- Indexes for dim_brands
CREATE INDEX idx_dim_brands_brand_id ON dim_brands(brand_id);

-- Populate dim_brands table
INSERT INTO dim_brands (brand_id, barcode, cpg_id, top_brand, brand_name, category, category_code, brand_code)
SELECT brand_uuid,barcode,cpg_oid, top_brand, name, category, category_code, brand_code
FROM brands;
