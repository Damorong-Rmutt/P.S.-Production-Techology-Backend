CREATE DATABASE ps_production CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;;

USE ps_production;

CREATE TABLE categories (
  category_id INT AUTO_INCREMENT PRIMARY KEY,
  category_name VARCHAR(255) NOT NULL,
  category_code VARCHAR(50) UNIQUE NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;;

-- ตารางสินค้า--
CREATE TABLE product(
  product_id INT AUTO_INCREMENT PRIMARY KEY,
  category_id INT,
  product_name VARCHAR(255) NOT NULL,
  product_price DECIMAL(10,2),
  product_old_price DECIMAL(10,2),
  product_img VARCHAR(255),
  product_description TEXT,
  FOREIGN KEY (category_id) REFERENCES categories(category_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;;

-- ตัวอย่างหมวดหมู่ --
INSERT INTO categories (category_name, category_code) VALUES 
('HIKVISION', 'hikvision'),
('DAHUA', 'dahua'),
('IMOU', 'imou'),
('EZVIZ', 'ezviz'),
('HILOOK', 'hilook'),
('LINK', 'link'),
('APOLLO', 'apollo');

-- ตัวอย่างสินค้า --
INSERT INTO product (category_id, product_name, product_price, product_old_price, product_img, product_description)
VALUES
(1, 'HIKVISION-001', 2990, 3990, 'https://place-hold.it/300x300', 'Lorem ipsum dolor sit amet...'),
(1, 'HIKVISION-002', 3590, 4590, 'https://place-hold.it/300x300', 'Lorem ipsum dolor sit amet...'),
(2, 'DAHUA-001', 2500, 3500, 'https://place-hold.it/300x300', 'Lorem ipsum dolor sit amet...'),
(3, 'IMOU-001', 1990, 2590, 'https://place-hold.it/300x300', 'Lorem ipsum dolor sit amet...');

