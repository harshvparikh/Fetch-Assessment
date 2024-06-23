CREATE TABLE dim_users (
    user_id VARCHAR(255) PRIMARY KEY,
    created_date TIMESTAMP,
    last_login TIMESTAMP,
	role VARCHAR(255),
    state VARCHAR(255),
    active VARCHAR(10)
);

-- Indexes for dim_users
CREATE INDEX idx_dim_users_created_date ON dim_users(created_date);

-- Populate dim_users table
INSERT INTO dim_users (user_id, created_date, last_login, role, state, active)
SELECT id, created_date, last_login, role, state, active
FROM users;
