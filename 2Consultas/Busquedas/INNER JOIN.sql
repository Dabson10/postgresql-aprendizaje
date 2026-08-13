/*      INNER JOIN
    Como tal el uso de INNER JOIN es para unir datos de dos o más tablas mediante la PK y FK,
     ambas deben coincidir para que muestre la fila.
     Este tipo de consultas es de las más utiles para no hacer demasiados SELECT y unir tablas.
*/
--Ejercicio 1
SELECT
    usuarios.nombre,
    tiendas.nombre_tienda
FROM usuarios
INNER JOIN tiendas ON usuarios.id = tiendas.id_usuario;

-- Union de 2 tablas(tiendas y productos), con un filtro WHERE. Con un filtro de ID.
SELECT
    tiendas.nombre_tienda, tiendas.creacion,
    productos.nombre, productos.descripcion , productos.precio, productos.stock
FROM tiendas
         INNER JOIN productos ON productos.id_tienda = tiendas.id
WHERE productos.id_tienda = 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44';

-- Union de 3 tablas (Tiendas, usuarios y productos), incluyendo un filtrado de cuál tienda se requiere
SELECT
    tiendas.nombre_tienda, tiendas.creacion,
    productos.nombre, productos.descripcion , productos.precio, productos.stock,
    usuarios.nombre, usuarios.email, usuarios.password
FROM tiendas
         INNER JOIN productos ON productos.id_tienda = tiendas.id
         INNER JOIN usuarios ON tiendas.id_usuario = usuarios.id
WHERE tiendas.nombre_tienda = 'TechZone';

-- Ejercicio 3 pero con prefijos.
SELECT
    t.nombre_tienda, t.creacion,
    p.nombre, p.descripcion , p.precio, p.stock,
    u.nombre, u.email
FROM tiendas t
         INNER JOIN productos p ON p.id_tienda = t.id
         INNER JOIN usuarios u ON t.id_usuario = u.id
WHERE t.nombre_tienda = 'TechZone';