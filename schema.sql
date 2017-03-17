/**
 Author: Mrin 
 Model : NorthWind
**/

DROP SCHEMA IF EXISTS northwind;

CREATE SCHEMA northwind;
USE northwind;

/* Table: customers */
CREATE TABLE customers (
  id              INT NOT NULL,
  company         VARCHAR(50) ,
  last_name       VARCHAR(50) ,
  first_name      VARCHAR(50) ,
  email_address   VARCHAR(50) ,
  job_title       VARCHAR(50) ,
  business_phone  VARCHAR(25) ,
  home_phone      VARCHAR(25) ,
  mobile_phone    VARCHAR(25) ,
  fax_number      VARCHAR(25) ,
  address         VARCHAR(250) ,
  city            VARCHAR(50) ,
  state_province  VARCHAR(50) ,
  zip_postal_code VARCHAR(15) ,
  country_region  VARCHAR(50) ,
  web_page        VARCHAR(250) ,
  notes           VARCHAR(250) ,
  attachments     LONGBLOB ,
  PRIMARY KEY (id)
);

/* Table: employees */
CREATE TABLE employees (
  id              INT NOT NULL,
  company         VARCHAR(50) ,
  last_name       VARCHAR(50) ,
  first_name      VARCHAR(50) ,
  email_address   VARCHAR(50) ,
  job_title       VARCHAR(50) ,
  business_phone  VARCHAR(25) ,
  home_phone      VARCHAR(25) ,
  mobile_phone    VARCHAR(25) ,
  fax_number      VARCHAR(25) ,
  address         VARCHAR(250) ,
  city            VARCHAR(50) ,
  state_province  VARCHAR(50) ,
  zip_postal_code VARCHAR(15) ,
  country_region  VARCHAR(50) ,
  web_page        VARCHAR(250) ,
  notes           VARCHAR(250) ,
  attachments     LONGBLOB ,
  PRIMARY KEY (id)
);

/* Table: inventory_transaction_types */
CREATE TABLE inventory_transaction_types (
  id TINYINT NOT NULL,
  type_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);

/* Table: shippers */
CREATE TABLE shippers (
  id              INT NOT NULL,
  company         VARCHAR(50) ,
  last_name       VARCHAR(50) ,
  first_name      VARCHAR(50) ,
  email_address   VARCHAR(50) ,
  job_title       VARCHAR(50) ,
  business_phone  VARCHAR(25) ,
  home_phone      VARCHAR(25) ,
  mobile_phone    VARCHAR(25) ,
  fax_number      VARCHAR(25) ,
  address         VARCHAR(250) ,
  city            VARCHAR(50) ,
  state_province  VARCHAR(50) ,
  zip_postal_code VARCHAR(15) ,
  country_region  VARCHAR(50) ,
  web_page        VARCHAR(250) ,
  notes           VARCHAR(250) ,
  attachments     LONGBLOB ,
  PRIMARY KEY (id)
);

/* Table: orders */
CREATE TABLE orders (
  id              INT NOT NULL,
  employee_id     INT ,
  customer_id     INT ,
  order_date      DATETIME ,
  shipped_date    DATETIME ,
  shipper_id      INT ,
  ship_name       VARCHAR(50) ,
  ship_address    VARCHAR(250) ,
  ship_city       VARCHAR(50) ,
  ship_state_province  VARCHAR(50) ,
  ship_zip_postal_code VARCHAR(50) ,
  ship_country_region  VARCHAR(50) ,
  shipping_fee    DECIMAL(19,4) NULL DEFAULT '0.0000',
  taxes           DECIMAL(19,4) NULL DEFAULT '0.0000',
  payment_type    VARCHAR(50) ,
  paid_date       DATETIME ,
  notes           VARCHAR(250) ,
  tax_rate        DOUBLE NULL DEFAULT '0',
  tax_status_id   TINYINT ,
  status_id       TINYINT NULL DEFAULT '0',
  PRIMARY KEY (id)
);

/* Table: orders_status */
CREATE TABLE orders_status (
  id          TINYINT     NOT NULL,
  status_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);

/* Table: orders_tax_status */
CREATE TABLE orders_tax_status (
  id              TINYINT     NOT NULL,
  tax_status_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);

/* Table: order_details */
CREATE TABLE order_details (
  id                  INT NOT NULL,  
  order_id            INT NOT NULL,
  product_id          INT ,
  quantity            DECIMAL(18,4) NOT NULL DEFAULT '0.0000',
  unit_price          DECIMAL(19,4) NULL DEFAULT '0.0000',
  discount            DOUBLE NOT NULL DEFAULT '0',
  status_id           INT ,
  date_allocated      DATETIME ,
  purchase_order_id   INT ,
  inventory_id        INT ,
  PRIMARY KEY (id)
);

/* Table: order_details_status */
CREATE TABLE order_details_status (
  id            INT         NOT NULL,
  status_name   VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);

/* Table: products */
CREATE TABLE products (
  id              INT NOT NULL,
  supplier_ids    VARCHAR(250) ,
  product_code    VARCHAR(25) ,
  product_name    VARCHAR(50) ,
  description     VARCHAR(250) ,
  standard_cost   DECIMAL(19,4) NULL DEFAULT '0.0000',
  list_price      DECIMAL(19,4) NOT NULL DEFAULT '0.0000',
  reorder_level   INT ,
  target_level    INT ,
  quantity_per_unit VARCHAR(50) ,
  discontinued    TINYINT NOT NULL DEFAULT '0',
  minimum_reorder_quantity INT ,
  category        VARCHAR(50) ,
  attachments     LONGBLOB ,
  PRIMARY KEY (id)
);

/* Table: suppliers */
CREATE TABLE suppliers (
  id              INT NOT NULL,
  company         VARCHAR(50) ,
  last_name       VARCHAR(50) ,
  first_name      VARCHAR(50) ,
  email_address   VARCHAR(50) ,
  job_title       VARCHAR(50) ,
  business_phone  VARCHAR(25) ,
  home_phone      VARCHAR(25) ,
  mobile_phone    VARCHAR(25) ,
  fax_number      VARCHAR(25) ,
  address         VARCHAR(250) ,
  city            VARCHAR(50) ,
  state_province  VARCHAR(50) ,
  zip_postal_code VARCHAR(15) ,
  country_region  VARCHAR(50) ,
  web_page        VARCHAR(250) ,
  notes           VARCHAR(250) ,
  attachments     LONGBLOB ,
  PRIMARY KEY (id)
);

/* Table: purchase_orders */
CREATE TABLE purchase_orders (
  id              INT NOT NULL,
  supplier_id     INT ,
  created_by      INT ,
  submitted_date  DATETIME ,
  creation_date   DATETIME ,
  status_id       INT NULL DEFAULT '0',
  expected_date   DATETIME ,
  shipping_fee    DECIMAL(19,4) NOT NULL DEFAULT '0.0000',
  taxes           DECIMAL(19,4) NOT NULL DEFAULT '0.0000',
  payment_date    DATETIME ,
  payment_amount  DECIMAL(19,4) NULL DEFAULT '0.0000',
  payment_method  VARCHAR(50) ,
  notes           VARCHAR(250) ,
  approved_by     INT ,
  approved_date   DATETIME ,
  submitted_by    INT ,
  PRIMARY KEY (id)
);

/* Table: purchase_order_details */
CREATE TABLE purchase_order_details (
  id                  INT NOT NULL,    
  purchase_order_id   INT NOT NULL,
  product_id          INT ,
  quantity            DECIMAL(18,4) NOT NULL,
  unit_cost           DECIMAL(19,4) NOT NULL,
  date_received       DATETIME ,
  posted_to_inventory TINYINT NOT NULL DEFAULT '0',
  inventory_id        INT ,
  PRIMARY KEY (id)
);

/* Table: purchase_order_status */
CREATE TABLE purchase_order_status (
  id      INT NOT NULL,
  status  VARCHAR(50) ,
  PRIMARY KEY (id)
);

/* Table: inventory_transactions */
CREATE TABLE inventory_transactions (
  id                  INT NOT NULL,
  transaction_type    TINYINT(4) NOT NULL,
  transaction_created_date    DATETIME ,
  transaction_modified_date   DATETIME ,
  product_id          INT NOT NULL,
  quantity            INT NOT NULL,
  purchase_order_id   INT ,
  customer_order_id   INT ,
  comments            VARCHAR(255) ,
  PRIMARY KEY (id)
);

/* Table: invoices */
CREATE TABLE invoices (
  id            INT NOT NULL,
  order_id      INT ,
  invoice_date  DATETIME ,
  due_date      DATETIME ,
  tax           DECIMAL(19,4) NULL DEFAULT '0.0000',
  shipping      DECIMAL(19,4) NULL DEFAULT '0.0000',
  amount_due    DECIMAL(19,4) NULL DEFAULT '0.0000',
  PRIMARY KEY (id)
);

/* Table: strings */
CREATE TABLE strings (
  string_id   INT NOT NULL,
  string_data VARCHAR(255) ,
  PRIMARY KEY (string_id)
);


/* Foreign Key: orders */
ALTER TABLE orders ADD CONSTRAINT fk_orders__customers FOREIGN KEY (customer_id) REFERENCES customers(id);
ALTER TABLE orders ADD CONSTRAINT fk_orders__employees FOREIGN KEY (employee_id) REFERENCES employees(id);
ALTER TABLE orders ADD CONSTRAINT fk_orders__shippers  FOREIGN KEY (shipper_id)  REFERENCES shippers(id);
ALTER TABLE orders ADD CONSTRAINT fk_orders__orders_tax_status FOREIGN KEY (tax_status_id) REFERENCES orders_tax_status(id);
ALTER TABLE orders ADD CONSTRAINT fk_orders__orders_status     FOREIGN KEY (status_id)     REFERENCES orders_status(id);
/* Foreign Key:  order_details */
ALTER TABLE order_details ADD CONSTRAINT fk_order_details__orders      FOREIGN KEY (order_id) REFERENCES orders(id);
ALTER TABLE order_details ADD CONSTRAINT fk_order_details__products    FOREIGN KEY (product_id) REFERENCES products(id);
ALTER TABLE order_details ADD CONSTRAINT fk_order_details__order_details_status FOREIGN KEY (status_id) REFERENCES order_details_status (id);

/* Foreign Key: inventory_transactions */
ALTER TABLE inventory_transactions ADD CONSTRAINT fk_inventory_transactions__orders          FOREIGN KEY (customer_order_id) REFERENCES orders(id);
ALTER TABLE inventory_transactions ADD CONSTRAINT fk_inventory_transactions__products        FOREIGN KEY (product_id) REFERENCES products(id);
ALTER TABLE inventory_transactions ADD CONSTRAINT fk_inventory_transactions__purchase_orders FOREIGN KEY (purchase_order_id) REFERENCES purchase_orders(id);
ALTER TABLE inventory_transactions ADD CONSTRAINT fk_inventory_transactions__inventory_transaction_types FOREIGN KEY (transaction_type) REFERENCES inventory_transaction_types(id);

/* Foreign Key: purchase_orders */
ALTER TABLE purchase_orders ADD CONSTRAINT fk_purchase_orders__employees FOREIGN KEY (created_by)  REFERENCES  employees(id);
ALTER TABLE purchase_orders ADD CONSTRAINT fk_purchase_orders__suppliers FOREIGN KEY (supplier_id) REFERENCES suppliers(id);
ALTER TABLE purchase_orders ADD CONSTRAINT fk_purchase_orders__purchase_order_status FOREIGN KEY (status_id) REFERENCES purchase_order_status(id);
/* Foreign Key: purchase_order_details */
ALTER TABLE purchase_order_details ADD CONSTRAINT fk_purchase_order_details__inventory_transactions FOREIGN KEY (inventory_id) REFERENCES inventory_transactions(id);
ALTER TABLE purchase_order_details ADD CONSTRAINT fk_purchase_order_details__products FOREIGN KEY (product_id) REFERENCES products (id);
ALTER TABLE purchase_order_details ADD CONSTRAINT fk_purchase_order_details__purchase_orders FOREIGN KEY (purchase_order_id) REFERENCES purchase_orders(id);

/* Foreign Key: invoices */
ALTER TABLE invoices ADD CONSTRAINT fk_invoices__orders FOREIGN KEY (order_id) REFERENCES orders(id);


