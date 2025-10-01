-- user table creation
CREATE TABLE IF NOT EXISTS `user` (
    id                      BINARY(16) PRIMARY KEY DEFAULT (UUID_TO_BIN(UUID())),
    username                VARCHAR(50) UNIQUE NOT NULL,
    password                VARCHAR(255) NOT NULL,
    enabled                 BOOLEAN NOT NULL DEFAULT TRUE,
    account_non_expired     BOOLEAN NOT NULL DEFAULT TRUE,
    account_non_locked      BOOLEAN NOT NULL DEFAULT TRUE,
    credentials_non_expired BOOLEAN NOT NULL DEFAULT TRUE,
    INDEX (username)  -- username index
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- authority table creation
CREATE TABLE IF NOT EXISTS `authority` (
    id        BINARY(16) PRIMARY KEY DEFAULT (UUID_TO_BIN(UUID())),
    user_id   BINARY(16) NOT NULL,
    authority ENUM('read', 'write') NOT NULL DEFAULT 'read',
    CONSTRAINT fk_authorities_users FOREIGN KEY (user_id)
    REFERENCES `user` (id) ON DELETE CASCADE ON UPDATE CASCADE,
    INDEX (user_id)  -- foreign key index
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;