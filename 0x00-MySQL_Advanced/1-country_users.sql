-- id integer never null auto increment
-- email string 255 never null unique

CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255),
    country ENUM('us', 'CO', 'TN') NOT NULL DEFAULT 'US',
    PRIMARY KEY (id)
);