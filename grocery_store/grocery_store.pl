/**
 * grocery_store.pl
 * Supplier and product information for a grocery store.
 *
 * This Prolog file contains facts and predicates related to suppliers and products in a grocery store.
 * It provides information about suppliers, their discounts, products, and the quantity of products they deliver.
 * The file also includes various predicates to query and retrieve specific information about the suppliers and products.
 *
 * Supplier Facts:
 * - Suppliers are represented by the predicate `f/4` with the following arguments:
 *   - Supplier ID
 *   - Supplier Name
 *   - Discount Percentage
 *   - Supplier City
 *
 * Product Facts:
 * - Products are represented by the predicate `p/4` with the following arguments:
 *   - Product ID
 *   - Product Name
 *   - Product Color
 *   - Product Origin
 *
 * Supplier-Product Relationship:
 * - The relationship between suppliers and products is represented by the predicate `mf/3` with the following arguments:
 *   - Supplier ID
 *   - Product ID
 *   - Quantity
 *
 * Predicates:
 * - `name/1`: Retrieves the name of a supplier.
 * - `nameFourni/1`: Retrieves the name of a supplier who delivers products.
 * - `originMercier/1`: Retrieves the origin of products delivered by the supplier "mercier".
 * - `produitFourni2/1`: Retrieves products delivered by at least two different suppliers.
 * - `fourniVille/1`: Retrieves the name of a supplier who delivers products in its own city.
 * - `fourniParisOU2ProduitVert/1`: Retrieves the name of a supplier who delivers products in Paris or delivers at least two green products.
 * - `produitRemise7/1`: Retrieves products delivered by a supplier who applies a discount of 7%.
 * - `fourniQteInf5/1`: Retrieves the name of a supplier who delivers products in a quantity less than 5.
 * - `fourniProduitPasVert/1`: Retrieves the name of a supplier who delivers products that are not green.
 * - `fourniAucunProduitVert/1`: Retrieves the name of a supplier who does not deliver any green products.
 */
% Supplier facts.



f(f1, bornibus, 5, paris).     % Supplier f1 from paris, bornibus, apllies a discount of 5%.
f(f2, mercier, 7, paris).      % Supplier f2 from paris, mercier, applies a discount of 7%.
f(f3, colbert, 3, reims).      % Supplier f3 from reims, colbert, applies a discount of 3%.
f(f4, bossuet, 6, dijon).      % Supplier f4 from dijon, bossuet, applies a discount of 6%.
f(f5, tanguy, 10, cancale).    % Supplier f5 from cancale, tanguy, applies a discount of 10%.
f(f6, dupont, 0, paris).       % Supplier f6 from paris, dupont, applies a discount of 0%.

p(p1, cassis, rouge, dijon).           % Product p1, cassis, is red and from Dijon.
p(p2, champagne, blanc, reims).        % Product p2, champagne, is white and from Reims.
p(p3, huitre, vert, cancale).          % Product p3, huitre, is green and from Cancale.
p(p4, moutarde, jaune, dijon).         % Product p4, moutarde, is yellow and from Dijon.
p(p5, salade, vert, nice).             % Product p5, salade, is green and from Nice.
p(p6, cornichon, vert, dijon).         % Product p6, cornichon, is green and from Dijon.
p(p7, muscadet, blanc, nantes).        % Product p7, muscadet, is white and from Nantes.

mf(f3, p2, 5).        % Supplier f3 delivers 5 units of product p2.
mf(f2, p2, 1).        % Supplier f2 delivers 1 unit of product p2.
mf(f1, p6, 2).        % Supplier f1 delivers 2 units of product p6.
mf(f1, p4, 1).        % Supplier f1 delivers 1 unit of product p4.
mf(f1, p1, 1).        % Supplier f1 delivers 1 unit of product p1.
mf(f4, p6, 3).        % Supplier f4 delivers 3 units of product p6.
mf(f4, p5, 7).        % Supplier f4 delivers 7 units of product p5.
mf(f1, p5, 8).        % Supplier f1 delivers 8 units of product p5.
mf(f4, p4, 2).        % Supplier f4 delivers 2 units of product p4.
mf(f3, p4, 1).        % Supplier f3 delivers 1 unit of product p4.
mf(f2, p4, 1).        % Supplier f2 delivers 1 unit of product p4.
mf(f5, p3, 10).       % Supplier f5 delivers 10 units of product p3.

% Predicate to get the name of a supplier.
name(Fournisseur) :- f(_, Fournisseur, _, _).

% Predicate to get the name of a supplier who delivers products.
nameFourni(Fournisseur) :- f(X, Fournisseur, _, _), mf(X, _, _).

% Predicate to get the origin of products delivered by supplier mercier.
originMercier(Origin) :- f(X, mercier, _, _), mf(X, P, _), p(P, _, _, Origin).

% Predicate to get products delivered by at least two different suppliers.
produitFourni2(Produit) :- p(P, Produit, _, _), mf(Y, P, _), mf(Y_bis, P, _), Y \= Y_bis.

% Predicate to get the name of a supplier who delivers products in its own city.
fourniVille(Fournisseur) :- f(F, Fournisseur, _, Ville), mf(F, P, _), p(P, _, _, Ville).

% Predicate to get the name of a supplier who delivers products in Paris or delivers at least two green products.
fourniParisOU2ProduitVert(Fournisseur) :- f(_, Fournisseur, _, paris); f(F, Fournisseur, _, _), mf(F, P1, _), mf(F, P2, _), p(P1, _, vert, _), p(P2, _, vert, _), P1 \= P2.

% Predicate to get products delivered by a supplier who applies a discount of 7%.
produitRemise7(Produit) :- p(P, Produit, _, _), mf(F, P, _), f(F, _, 7, _).

% Predicate to get the name of a supplier who delivers products in a quantity less than 5.
fourniQteInf5(Fournisseur) :- f(F, Fournisseur, _, _), mf(F, P, Quantite), Quantite < 5.

% Predicate to get the name of a supplier who delivers products that are not green.
fourniProduitPasVert(Fournisseur) :- f(F, Fournisseur, _, _), mf(F, P, _), p(P, _, Couleur, _), Couleur \= vert.

% Predicate to get the name of a supplier who does not deliver any green products.
fourniAucunProduitVert(Fournisseur) :- f(F, Fournisseur, _, _), \+ (mf(F, P, _), p(P, _, vert, _)).