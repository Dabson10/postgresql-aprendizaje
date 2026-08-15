/*  LEFT JOIN
  El uso de LEFT JOIN es para unir 1 o más tablas, pero con la diferencia de que si
   en la tabla derecha no existen valores entonces se mostrará un NULL, para entender
   mejor esto de tabla Izquierda y Derecha, mejor explicarlo con ejemplo.

    SELECT *
    FROM tabla_izquierda
    LEFT JOIN tabla_derecha
    ON tabla_izquierda.id = tabla_derecha;

    *Cuando se utiliza LEFT JOIN significa que de la tabla izquierda,
    "la que esta después del FROM" mostrara los datos existentes correspondiendo al ID,
    y la tabla derecha que es después del "LEFT JOIN" mostrara los datos que encuentre,
    pero si no encuentra nada entonces mostrará un null, como tal la prioridad es la tabla izquierda.
*/

-- Ejercicio 2
SELECT usuarios.nombre, tiendas.nombre_tienda
FROM usuarios
LEFT JOIN tiendas ON usuarios.id = tiendas.id_usuario;

/* Ejercicio 5
   *Obtener nombre de usuario,
   nombre de su tienda(si tiene una, si no no importa),
   cantidad de productos que tiende esa tienda
   y si el usuario no tiene nada o su tienda no tiene productos
   ese número debe de ser 0 */
SELECT usu.nombre,
       ti.nombre_tienda,
       COUNT(pr.nombre) AS cant_productos
FROM usuarios usu
        LEFT JOIN tiendas ti ON usu.id = ti.id_usuario
        LEFT JOIN productos pr ON ti.id = pr.id_tienda
GROUP BY usu.nombre, ti.nombre_tienda
HAVING COUNT(pr.nombre) > 2
ORDER BY cant_productos ASC;
/*
La diferencia entre WHERE y HAVING es simple.
WHERE filtra filas individuales antes de realizar una agrupación, esta no permite 
 funciones de agregación.
HAVING filtra los resultados de los GRUPOS despues de ejecutar el GROUP BY 
*/

--Esta consulta es similar a la anterior solo que esta ordena de mayor a menor.
SELECT usu.nombre,
       ti.nombre_tienda,
       COUNT(pr.nombre) AS cant_productos
FROM usuarios usu
         LEFT JOIN tiendas ti ON usu.id = ti.id_usuario
         LEFT JOIN productos pr ON ti.id = pr.id_tienda
GROUP BY usu.nombre, ti.nombre_tienda
HAVING COUNT(pr.nombre) > 2
ORDER BY cant_productos DESC ;