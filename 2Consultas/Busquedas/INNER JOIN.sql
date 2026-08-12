/*      INNER JOIN
    Como tal el uso de INNER JOIN es para unir datos de dos o mas tablas mediante la PK y FK,
     ambas deben coincidir para que muestre la fila.
     Este tipo de consultas es de las mas utiles para no hacer demasiados SELECT y unir tablas.
*/
SELECT * FROM productos
                  INNER JOIN tiendas ON productos.id_tienda = tiendas.id;

-- Union de 2 tablas(tiendas y productos), con un filtro WHERE.
SELECT
    tiendas.nombre_tienda, tiendas.creacion,
    productos.nombre, productos.descripcion , productos.precio, productos.stock
FROM tiendas
         INNER JOIN productos ON productos.id_tienda = tiendas.id
WHERE productos.id_tienda = 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44';

-- Union de 3 tablas (Tiendas, usuarios y productos)
SELECT
    tiendas.nombre_tienda, tiendas.creacion,
    productos.nombre, productos.descripcion , productos.precio, productos.stock,
    usuarios.nombre, usuarios.email, usuarios.password
FROM tiendas
         INNER JOIN productos ON productos.id_tienda = tiendas.id
         INNER JOIN usuarios ON tiendas.id_usuario = usuarios.id
WHERE productos.id_tienda = 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44';
