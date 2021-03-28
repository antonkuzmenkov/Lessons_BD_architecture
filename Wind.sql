CREATE TABLE k_categories (
	k_categories_rk bigint PRIMARY KEY,
    category_id smallint,
    source_system character varying(255),
    processed_dttm date
);

CREATE TABLE k_products (
	k_products_rk bigint PRIMARY KEY,
    product_id smallint,
    source_system character varying(255),
    processed_dttm date
);

CREATE TABLE k_suppliers (
	k_suppliers_rk bigint PRIMARY KEY,
    supplier_id smallint,
    source_system character varying(255),
    processed_dttm date
);

CREATE TABLE k_shippers (
	k_shippers_id bigint PRIMARY KEY,
    shipper_id smallint,
    source_system character varying(255),
    processed_dttm date
);

CREATE TABLE k_orders (
	k_orders_rk bigint PRIMARY KEY,
    order_id smallint,
    source_system character varying(255),
    processed_dttm date
);

CREATE TABLE k_customers (
	k_customers_rk bigint PRIMARY KEY,
    customer_id smallint,
    source_system character varying(255),
    processed_dttm date
);

CREATE TABLE k_customer_demographics (
	k_customer_demographics_rk bigint PRIMARY KEY,
    customer_type_id smallint,
    source_system character varying(255),
    processed_dttm date
);

CREATE TABLE k_employees (
	k_employees_rk bigint PRIMARY KEY,
    employee_id smallint,
    source_system character varying(255),
    processed_dttm date
);

CREATE TABLE k_territories (
	k_territories_rk bigint PRIMARY KEY,
    territory_id smallint,
    source_system character varying(255),
    processed_dttm date
);

CREATE TABLE k_region (
	k_region_rk bigint PRIMARY KEY,
    region_id smallint,
    source_system character varying(255),
    processed_dttm date
);



--
-- Links
-- 
CREATE TABLE l_categories_products (
	l_categories_products_rk bigint PRIMARY KEY,
	k_categories_rk bigint,
    k_products_rk bigint,
    source_system character varying(255),
    processed_dttm date,
    FOREIGN KEY (k_categories_rk) REFERENCES k_categories,
    FOREIGN KEY (k_products_rk) REFERENCES k_products
);

CREATE TABLE l_suppliers_products (
	l_suppliers_products_rk bigint PRIMARY KEY,
	k_suppliers_rk bigint,
    k_products_rk bigint,
    source_system character varying(255),
    processed_dttm date,
    FOREIGN KEY (k_suppliers_rk) REFERENCES k_suppliers,
    FOREIGN KEY (k_products_rk) REFERENCES k_products
);

CREATE TABLE l_products_orders (
	l_products_orders_rk bigint PRIMARY KEY,
	k_orders_rk bigint,
	k_products_rk bigint,    
    source_system character varying(255),
    processed_dttm date,
    FOREIGN KEY (k_orders_rk) REFERENCES k_orders,
    FOREIGN KEY (k_products_rk) REFERENCES k_products
);

CREATE TABLE l_shippers_orders (
	l_shippers_orders_rk bigint PRIMARY KEY,
	k_shippers_rk bigint,
    k_orders_rk bigint,
    source_system character varying(255),
    processed_dttm date,
    FOREIGN KEY (k_shippers_rk) REFERENCES k_shippers,
    FOREIGN KEY (k_orders_rk) REFERENCES k_orders
);

CREATE TABLE l_customers_orders (
	l_customers_orders_rk bigint PRIMARY KEY,
	k_customers_rk bigint,
	k_orders_rk bigint,    
    source_system character varying(255),
    processed_dttm date,
    FOREIGN KEY (k_customers_rk) REFERENCES k_customers,
    FOREIGN KEY (k_orders_rk) REFERENCES k_orders
);

CREATE TABLE l_customer_demographics_customers (
	l_customer_demographics_customers_rk bigint PRIMARY KEY,
	k_customer_demographics_rk bigint,
	k_customers_rk bigint,
    source_system character varying(255),
    processed_dttm date,
    FOREIGN KEY (k_customer_demographics_rk) REFERENCES k_customer_demographics,
    FOREIGN KEY (k_customers_rk) REFERENCES k_customers
);

CREATE TABLE l_employees_orders (
	l_employees_orders_rk bigint PRIMARY KEY,
	k_employees_rk bigint,
    k_orders_rk bigint,
    source_system character varying(255),
    processed_dttm date,
    FOREIGN KEY (k_employees_rk) REFERENCES k_employees,
    FOREIGN KEY (k_orders_rk) REFERENCES k_orders
);

CREATE TABLE l_employees_territories (
	l_employees_territories_rk bigint PRIMARY KEY,
	k_employees_rk bigint,
	k_territories_rk bigint,
    source_system character varying(255),
    processed_dttm date,
    FOREIGN KEY (k_employees_rk) REFERENCES k_employees,
    FOREIGN KEY (k_territories_rk) REFERENCES k_territories
);

CREATE TABLE l_employees_employees (
	l_employees_employees_rk bigint PRIMARY KEY,
	k_employees_rk bigint,
    k_employees_rk_reports_to bigint,
    source_system character varying(255),
    processed_dttm date,
    FOREIGN KEY (k_employees_rk) REFERENCES k_employees,
    FOREIGN KEY (k_employees_rk_reports_to) REFERENCES k_employees (k_employees_rk)
);

CREATE TABLE l_territories_region (
	l_territories_region_rk bigint PRIMARY KEY,
	k_territories_rk bigint,
   	k_region_rk bigint,
    source_system character varying(255),
    processed_dttm date,
    FOREIGN KEY (k_territories_rk) REFERENCES k_territories,
    FOREIGN KEY (k_region_rk) REFERENCES k_region
);





--
-- Satellites
--


CREATE TABLE s_categories (
	k_categories_rk bigint,
    category_name character varying(15) NOT NULL,
    description text,
    picture bytea,
    valid_from_dttm date,
    valid_to_dttm date,
    source_system character varying(255),
    processed_dttm date,
    FOREIGN KEY (k_categories_rk) REFERENCES k_categories
);

CREATE TABLE s_customer_demographics (
	k_customer_demographics_rk bigint,
    customer_desc text,
    valid_from_dttm date,
    valid_to_dttm date,
    source_system character varying(255),
    processed_dttm date,
    FOREIGN KEY (k_customer_demographics_rk) REFERENCES k_customer_demographics
);

CREATE TABLE s_customers (
	k_customers_rk bigint,
    company_name character varying(40) NOT NULL,
    contact_name character varying(30),
    contact_title character varying(30),
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postal_code character varying(10),
    country character varying(15),
    phone character varying(24),
    fax character varying(24),
    valid_from_dttm date,
    valid_to_dttm date,
    source_system character varying(255),
    processed_dttm date,
    FOREIGN KEY (k_customers_rk) REFERENCES k_customers
);

CREATE TABLE s_employees (
	k_employees_rk bigint,
    last_name character varying(20) NOT NULL,
    first_name character varying(10) NOT NULL,
    title character varying(30),
    title_of_courtesy character varying(25),
    birtk_date date,
    hire_date date,
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postal_code character varying(10),
    country character varying(15),
    home_phone character varying(24),
    extension character varying(4),
    photo bytea,
    notes text,
    photo_path character varying(255),
    valid_from_dttm date,
    valid_to_dttm date,
    source_system character varying(255),
    processed_dttm date,
    FOREIGN KEY (k_employees_rk) REFERENCES k_employees
);

CREATE TABLE s_suppliers (
	k_suppliers_rk bigint,
    company_name character varying(40) NOT NULL,
    contact_name character varying(30),
    contact_title character varying(30),
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postal_code character varying(10),
    country character varying(15),
    phone character varying(24),
    fax character varying(24),
    homepage text,
    valid_from_dttm date,
    valid_to_dttm date,
    source_system character varying(255),
    processed_dttm date,
    FOREIGN KEY (k_suppliers_rk) REFERENCES k_suppliers
);

CREATE TABLE s_products (
	k_products_rk bigint,
    product_name character varying(40) NOT NULL,    
    quantity_per_unit character varying(20),
    unit_price real,
    units_in_stock smallint,
    units_on_order smallint,
    reorder_level smallint,
    discontinued integer NOT NULL,
    valid_from_dttm date,
    valid_to_dttm date,
    source_system character varying(255),
    processed_dttm date,
    FOREIGN KEY (k_products_rk) REFERENCES k_products
);

CREATE TABLE s_region (
	k_region_rk bigint,
    region_description bpchar NOT NULL,
    valid_from_dttm date,
    valid_to_dttm date,
    source_system character varying(255),
    processed_dttm date,
    FOREIGN KEY (k_region_rk) REFERENCES k_region
);

CREATE TABLE s_shippers (
	k_shippers_rk bigint,
    company_name character varying(40) NOT NULL,
    phone character varying(24),
    valid_from_dttm date,
    valid_to_dttm date,
    source_system character varying(255),
    processed_dttm date,
    FOREIGN KEY (k_shippers_rk) REFERENCES k_shippers
);

CREATE TABLE s_orders (
	k_orders_rk bigint,
    order_date date,
    required_date date,
    shipped_date date,    
    freight real,
    ship_name character varying(40),
    ship_address character varying(60),
    ship_city character varying(15),
    ship_region character varying(15),
    ship_postal_code character varying(10),
    ship_country character varying(15),
    valid_from_dttm date,
    valid_to_dttm date,
    source_system character varying(255),
    processed_dttm date,
    FOREIGN KEY (k_orders_rk) REFERENCES k_orders
);

CREATE TABLE s_territories (
	k_territories_rk bigint,
    territory_description bpchar NOT NULL,
    valid_from_dttm date,
    valid_to_dttm date,
    source_system character varying(255),
    processed_dttm date,
    FOREIGN KEY (k_territories_rk) REFERENCES k_territories
);

CREATE TABLE l_s_products_orders (
	l_products_orders_rk bigint,
    unit_price real NOT NULL,
    quantity smallint NOT NULL,
    discount real NOT NULL,
    valid_from_dttm date,
    valid_to_dttm date,
    source_system character varying(255),
    processed_dttm date,
    FOREIGN KEY (l_products_orders_rk) REFERENCES l_products_orders