-- CREATE DATABASE ecommerce;

-- 1. brand
CREATE TABLE brand (brand_id INT AUTO_INCREMENT PRIMARY KEY,
brand_name VARCHAR(100) NOT NULL
);

-- 2. product_category
CREATE TABLE product_category (category_id INT AUTO_INCREMENT PRIMARY KEY,
category_name VARCHAR(100) NOT NULL
);

-- 3. product
CREATE TABLE product (product_id INT AUTO_INCREMENT PRIMARY KEY, product_name VARCHAR(150) NOT NULL,
base_price DECIMAL(10, 2) NOT NULL, brand_id INT,category_id INT,
FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);

-- 4. product_image
CREATE TABLE product_image (image_id INT AUTO_INCREMENT PRIMARY KEY, product_id INT, image_url VARCHAR(255),
FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- 5. color
CREATE TABLE color (color_id INT AUTO_INCREMENT PRIMARY KEY, color_name VARCHAR(50) NOT NULL,
hex_code VARCHAR(7)
);

-- 6. size_category
CREATE TABLE size_category (size_cat_id INT AUTO_INCREMENT PRIMARY KEY,
category_name VARCHAR(100) NOT NULL
);

-- 7. size_option
CREATE TABLE size_option (
size_option_id INT AUTO_INCREMENT PRIMARY KEY, size_label VARCHAR(20) NOT NULL,
size_cat_id INT,
FOREIGN KEY (size_cat_id) REFERENCES size_category(size_cat_id)
);

-- 8. product_variation
CREATE TABLE product_variation (
    variation_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    color_id INT,
    size_option_id INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id)
    );

    -- 9. product_item
CREATE TABLE product_item (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    variation_id INT,
    sku VARCHAR(100) UNIQUE NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_qty INT NOT NULL,
    FOREIGN KEY (variation_id) REFERENCES product_variation(variation_id)
);

-- 10. attribute_category
CREATE TABLE attribute_category (
    attr_cat_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- 11. attribute_type
CREATE TABLE attribute_type (
    attr_type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(50) NOT NULL
);

-- 12. product_attribute
CREATE TABLE product_attribute (
    attr_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    attr_cat_id INT,
    attr_type_id INT,
    name VARCHAR(100) NOT NULL,
    value VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (attr_cat_id) REFERENCES attribute_category(attr_cat_id),
    FOREIGN KEY (attr_type_id) REFERENCES attribute_type(attr_type_id)
);