/*Ejercicios para practicar subconsultas y funciones de agregación.*/

/*1. Mostrar el precio total del inventario de cada tienda
  ¿Si se vendiera todo el STOCK disponible cuanto dinero entraría */
-- Calcula por producto existente y asociado a este
    SELECT
        ti.nombre_tienda,
        SUM(pr.precio * pr.stock) AS total
    FROM tiendas ti
    LEFT JOIN productos pr ON ti.id = pr.id_tienda
    GROUP BY ti.id, ti.nombre_tienda
    ORDER BY total DESC;


/*2. Mostrar cuantos productos tiene cada tienda, mostrando el nombre de la tienda
  pero separados por si estan agotados o disponibles, es decir cada tienda debería
  poder aparecer hasta 2 veces  en el resultado*/


/*3. Mostrar cuantos empleados tiene cada tienda, mostrando el nombre de la tienda.*/

/*4. Mostrar cada categoria, cuantos productos distintos tiene asociados */