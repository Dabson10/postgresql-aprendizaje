/*      INNER JOIN
    Como tal el uso de INNER JOIN es para unir datos de dos o más tablas mediante la PK y FK,
     ambas deben coincidir para que muestre la fila.
     Este tipo de consultas es de las más utiles para no hacer demasiados SELECT y unir tablas.
*/
--Ejercicio 1
-- Lista el nombre de cada usuario y su tienda asignada.
SELECT
    usuarios.nombre,
    tiendas.nombre_tienda
FROM usuarios
INNER JOIN tiendas ON usuarios.id = tiendas.id_usuario;

-- Union de 2 tablas(tiendas y productos), con un filtro WHERE. Con un filtro de ID.
-- Lista la tienda y sus productos
SELECT
    tiendas.nombre_tienda, tiendas.creacion,
    productos.nombre, productos.descripcion , productos.precio, productos.stock
FROM tiendas
         INNER JOIN productos ON productos.id_tienda = tiendas.id
WHERE productos.id_tienda = 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44';

-- Union de 3 tablas (Tiendas, usuarios y productos), incluyendo un filtrado de cuál tienda se requiere
-- Lista tienda, productos y usuarios, con un filtro para buscar una 
-- tienda específica mediante INNER JOIN
SELECT
    tiendas.nombre_tienda, tiendas.creacion,
    productos.nombre, productos.descripcion , productos.precio, productos.stock,
    usuarios.nombre, usuarios.email, usuarios.password
FROM tiendas
         INNER JOIN productos ON productos.id_tienda = tiendas.id
         INNER JOIN usuarios ON tiendas.id_usuario = usuarios.id
WHERE tiendas.nombre_tienda = 'TechZone';

-- Ejercicio 3 pero con prefijos.
-- Esta consulta es la misma que la anterior solo que en esta se utilizan prefijos
-- para no poner el nombre de la tabla como tal.
SELECT
    t.nombre_tienda, t.creacion,
    p.nombre, p.descripcion , p.precio, p.stock,
    u.nombre, u.email
FROM tiendas t
         INNER JOIN productos p ON p.id_tienda = t.id
         INNER JOIN usuarios u ON t.id_usuario = u.id
WHERE t.nombre_tienda = 'TechZone';

-- INNER JOIN para traer usuarios de cierta tienda.
SELECT ti.id AS ID_tienda, ti.nombre_tienda,
       usu.id, usu.nombre, usu.email
FROM tiendas ti
INNER JOIN usuarios usu ON ti.id_usuario = usu.id
WHERE ti.nombre_tienda = 'Polleria';


-- INNER JOIN para unir usuarios, tiendas y empleados_tienda
/*Se necesita un SELECT que muestre nombre de la tienda, nombre del empleado y su rol en
  tienda*/
SELECT
    tien.nombre_tienda,
    usu.nombre,
    emp.rol
FROM empleados_tienda emp
INNER JOIN usuarios usu ON emp.id_usuario = usu.id
INNER JOIN tiendas tien ON emp.id_tiendas = tien.id;


/*Se necesita que una sola consulta muestre por cada tienda:
 nombre de la tienda + cantidad de productos + cantidad de empleados.
*/
SELECT
    ti.nombre_tienda,
    COUNT(DISTINCT pr.*) AS cant_productos,
    COUNT(DISTINCT emp.*) AS cant_empleados
FROM tiendas ti
LEFT JOIN productos pr ON ti.id = pr.id_tienda
LEFT JOIN empleados_tienda emp ON ti.id = emp.id_tiendas
GROUP BY ti.nombre_tienda
order by cant_productos, cant_empleados DESC;
/*Puede existir un problema con respecto a consultas SELECT en tablas en las que hay relaciones
  del tipo 1:N ya que al encontrar valores coincidentes podría multiplicar las coincidencias de
  una por la otra por lo que ahi podrían existir errores o duplicados, para esto de una manera simple,
  podemos agregar un DISTINCT en la parte del COUNT o cualquier función de agregación.
  Un ejemplo correcto es la consulta anterior en la que no existirán problemas.
  Un ejemplo erróneo es el siguiente.
    SELECT
        ti.nombre_tienda,
        COUNT(pr.*) AS cant_productos,
        COUNT(emp.*) AS cant_empleados
    FROM tiendas ti
    LEFT JOIN productos pr ON ti.id = pr.id_tienda
    LEFT JOIN empleados_tienda emp ON ti.id = emp.id_tiendas
    GROUP BY ti.nombre_tienda;
  */

  -- INNER JOIN para relaciones n:n

/*1.Mostrar nombre de producto + nombre de categoria*/
SELECT
    pr.nombre,
    cat.nombre_categoria
FROM productos pr
INNER JOIN productos_categorias pr_cat
    ON pr.id = pr_cat.id_producto
INNER JOIN categorias cat
    ON cat.id = pr_cat.id_categoria
WHERE pr.nombre = 'Teclado Mecánico RGB';

SELECT * FROM usuarios;


