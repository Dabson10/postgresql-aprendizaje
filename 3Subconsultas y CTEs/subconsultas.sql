/* CTE Common Table Expression o Expresión de tabla común
En este archivo se encontrarán consulta, más bien sub consultas llamadas
 "CTEs". Este tipo de herramienta es por asi decirlo una tabla que se crea
cuando se realiza el select, la unica diferencia de este tipo de tabla es que
esta tabla tiene un tiempo de vida es durante la ejecución del SELECT.
Puede ser utilizada para realizar algún tipo de operacion antes de la consulta inicial,
para que la consulta inicial no se vea tan cargada*/
WITH contar_productos AS(
    SELECT
        ti.nombre_tienda,
        COUNT(pr.id) AS cant_productos
    FROM tiendas ti
    INNER JOIN productos pr ON ti.id = pr.id_tienda
    GROUP BY ti.nombre_tienda
)
SELECT
    *
FROM contar_productos cp
WHERE cp.cant_productos > 2
ORDER BY cp.cant_productos DESC;


/*Ejercicio 1
  Consulta que obtiene:
  nombre de la tienda + cantidad de productos + cantidad de empleados*/

WITH cte_productos AS(
    SELECT
        ti.id,
        COUNT(pr.id) AS cant_productos
    FROM tiendas ti
    LEFT JOIN productos pr ON ti.id = pr.id_tienda
    GROUP BY ti.id
), cte_empleados AS(
    SELECT
        ti.id,
        COUNT(emp.id) AS cant_empleados
    FROM tiendas ti
    LEFT JOIN empleados_tienda emp ON ti.id = emp.id_tiendas
    GROUP BY ti.id
)
SELECT
    ti.nombre_tienda,
    cte_pr.cant_productos,
    cte_emp.cant_empleados
FROM tiendas ti
LEFT JOIN cte_productos cte_pr ON ti.id = cte_pr.id
LEFT JOIN cte_empleados cte_emp ON ti.id = cte_emp.id
ORDER BY cte_pr.cant_productos, cte_emp.cant_empleados DESC;

