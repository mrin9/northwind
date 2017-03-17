# Basic SQL equivalent of Northwind schema 
The Northwind database from Microsoft has a nice and simple schema that deals with 
with customers, orders, inventory, purchasing, suppliers, shipping, employees, and single-entry accounting.
<br/>
This project is an attempt to create database agnostic srcript so that it can be reused in various other databases

# Files
* schema.sql - Contains DDL Ctatements (Table creation and Foreign Key definations)
* data.sql   - Contains Insert statements to populate database with sample data
* Northwind_Model_MySQLWorkbench.mwb - This File can be opened with MySQLWorkbench, and you may use to generate schema script or model diagram

## Naming Convention used 
* Field names are in `snake_case` instead of `CamelCase`. 
    * To facilitate some ORM frameworks (Hibernate/Spring Data) which uses field names to generate Java method names
    * Some databases and OS combination ignore case in field names therefore CamelCase dont make much sense
* primary keys named `id`.
* foreign keys constrained named as `fk_table_name__reference_table_name`.
* All the column data types are valid with most databases


## Schema Diagram
![Northwind Schema](/NorthwindModel.png?raw=true)