SELECT * FROM productos;
/**
  Para saber como funcionan las funciones de ventana podremos utilizar
  como ejemplo ya sea un ORDER BY y GROUP BY solo que en esta puedes agregar funcionalidades
  extra.

  Lo que necesita una función de ventana es:
  Una función para que esta ventana funcione como: ROW_NUMBER(), RANK(), DENSE_RANK, etc.
  La misma ventana, bajo que quieres crear una ventana ya sea básica o con partición.
  Básica: OVER(ORDER BY precio DESC)
  con partición: OVER(PARTITION BY categoria ORDER BY precio DESC).

  Como extra para agregarlo a una consulta en la que puede haber otras necesidades es recomendado hacer la consulta con
  la función de ventana en una subclase, esto lo podemos ver en la última consulta.
 */

--1. Ordenamos por precio
SELECT
    pr.nombre, pr.precio, pr.stock
FROM productos pr
ORDER BY pr.precio DESC;

--2. Utilizamos una función de ventana para agregar una columna que los liste.
SELECT
    pr.nombre, pr.precio, pr.stock,
    ROW_NUMBER() OVER(ORDER BY pr.precio DESC) AS enumerados
FROM productos pr;

--2.1 Otras funciones que se pueden implementar a la ventana
SELECT
    pr.nombre, pr.precio, pr.stock,
    ROW_NUMBER() OVER(ORDER BY pr.precio DESC) AS enumerados,
    RANK() OVER(ORDER BY pr.precio DESC) AS Rank,
    DENSE_RANK() OVER(ORDER BY pr.precio DESC)
FROM productos pr;

--3. Hacemos un rankin con base en mayor precio
WITH rankin AS(
    SELECT
        pr.nombre, pr.precio, pr.stock,
        cat.nombre_categoria,
        ROW_NUMBER() OVER(PARTITION BY cat.nombre_categoria ORDER BY pr.precio DESC) AS top_precio
    FROM productos pr
    LEFT JOIN productos_categorias prCat ON pr.id = prCat.id_producto
    LEFT JOIN categorias cat ON prCat .id_categoria = cat.id
)
SELECT *
FROM rankin r
WHERE r.top_precio <= 3;


