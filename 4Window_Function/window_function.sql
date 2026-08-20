
SELECT
            COUNT(*) OVER (PARTITION BY pr.id_tienda)
FROM productos pr;
SELECT * FROM productos;
