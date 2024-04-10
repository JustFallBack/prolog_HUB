## grocery_store.pl

Supplier and product information for a grocery store.

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

- `name/1`: Retrieves the name of a supplier.
- `nameFourni/1`: Retrieves the name of a supplier who delivers products.
- `originMercier/1`: Retrieves the origin of products delivered by the supplier "mercier".
- `produitFourni2/1`: Retrieves products delivered by at least two different suppliers.
- `fourniVille/1`: Retrieves the name of a supplier who delivers products in its own city.
- `fourniParisOU2ProduitVert/1`: Retrieves the name of a supplier who delivers products in Paris or delivers at least two green products.
- `produitRemise7/1`: Retrieves products delivered by a supplier who applies a discount of 7%.
- `fourniQteInf5/1`: Retrieves the name of a supplier who delivers products in a quantity less than 5.
- `fourniProduitPasVert/1`: Retrieves the name of a supplier who delivers products that are not green.
- `fourniAucunProduitVert/1`: Retrieves the name of a supplier who does not deliver any green products.
