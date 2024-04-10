# grocery_store.pl

Supplier and product information for a grocery store.

## Explanation

This Prolog file contains facts and predicates related to suppliers and products in a grocery store. It provides information about suppliers, their discounts, products, and the quantity of products they deliver. The file also includes various predicates to query and retrieve specific information about the suppliers and products.

### Supplier Facts

Suppliers are represented by the predicate `f/4` with the following arguments:
- Supplier ID
- Supplier Name
- Discount Percentage
- Supplier City

### Product Facts

Products are represented by the predicate `p/4` with the following arguments:
- Product ID
- Product Name
- Product Color
- Product Origin

### Supplier-Product Relationship

The relationship between suppliers and products is represented by the predicate `mf/3` with the following arguments:
- Supplier ID
- Product ID
- Quantity

### Predicates

- `supplier_name\1`: Retrieves the name of a supplier.
- `supplier_name_delivers_products\1`: Retrieves the name of a supplier who delivers products.
- `origin_mercier\1`: Retrieves the origin of products delivered by the supplier "mercier".
- `product_delivered_by_multiple_suppliers\1`: Retrieves products delivered by at least two different suppliers.
- `supplier_delivers_in_own_city\1`: Retrieves the name of a supplier who delivers products in its own city.
- `supplier_delivers_in_paris_or_two_green_products\1`: Retrieves the name of a supplier who delivers products in Paris or delivers at least two green products.
- `product_with_7_percent_discount\1`: Retrieves products delivered by a supplier who applies a discount of 7%.
- `supplier_delivers_less_than_5_quantity\1`: Retrieves the name of a supplier who delivers products in a quantity less than 5.
- `supplier_delivers_non_green_product\1`: Retrieves the name of a supplier who delivers products that are not green.
- `supplier_delivers_no_green_products\1`: Retrieves the name of a supplier who does not deliver any green products.

### Usage

This Prolog file can be consulted and queried to retrieve specific information about suppliers and products in the grocery store.

```prolog
consult(grocery_store).
supplier_name(X).
supplier_name_delivers_products(X).
origin_mercier(X).
product_delivered_by_multiple_suppliers(X).
supplier_delivers_in_own_city(X).
supplier_delivers_in_paris_or_two_green_products(X).
product_with_7_percent_discount(X).
supplier_delivers_less_than_5_quantity(X).
supplier_delivers_non_green_product(X).
supplier_delivers_no_green_products(X).
