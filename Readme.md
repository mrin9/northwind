# Basic SQL equivalent of Northwind schema 
The Northwind database from Microsoft has a nice and simple schema that deals with 
with customers, orders, inventory, purchasing, suppliers, shipping, employees, and single-entry accounting.
<br/>
This project is an attempt to create database agnostic srcript so that it can be reused in various other databases

## Naming Convention used 
* Field names are in `snake_case` instead of `CamelCase`. 
    * To facilitate some ORM frameworks (Hibernate/Spring Data) which uses field names to generate Java method names
    * Some databases and OS combination ignore case in field names therefore CamelCase dont make much sense
* primary keys named `id`.
* foreign keys constrained named as `fk_table_name__reference_table_name`.
* All the column data types are valid with most databases

## Two Datasets
* Northwind Small    (Few tables more data in each tables)
* Northwind Extended (More Tables, More references, Less data per table)


## Files
* **Northwind Small**
    * schema.sql - DDL Statements (Table creation & Foreign Key definations)
    * data.sql   - Insert statements to populate with sample data

* **Northwind Extended**
    * schema_extended.sql - DDL Statements (Table creation & Foreign Key definations)
    * data_extended.sql   - Insert statements to populate with sample data


* NorthwindModel_MySQLWorkbench.mwb - This File can be opened with MySQLWorkbench, you may use it to generate schema script or 
model diagram

## Schema Diagram
### Northwind Small
![Northwind Schema](/NorthwindModel_Small_.png?raw=true)

### Northwind Extended
![Northwind Schema](/NorthwindModel_Extended.png?raw=true)
