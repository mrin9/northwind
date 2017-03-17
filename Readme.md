# Basic SQL equivalent of Northwind schema 
The Northwind database from Microsoft has a nice and simple schema that deals with 
with customers, orders, inventory, purchasing, suppliers, shipping, employees, and single-entry accounting.
<br/>
This project is an attempt to create database agnostic srcript so that it can be reused in various other databases


## Schema Modification
* Modified the field names from the original schema by using `snake_case` instead of `CamelCase`. 
    * This is done to facilitate some ORM frameworks (Hibernate, Spring Data) which uses field names to generate Java method names
    * Some databases and os combination ignore case in field names therefore CamelCase dont make sense
* Renamed primary keys to `id`.
* Renamed foreign keys to `fk_table_name__reference_table_name`.
* Changed column data types and used database neutral types

###Schema Diagram
![Northwind Schema](/NorthwindModel.png?raw=true)