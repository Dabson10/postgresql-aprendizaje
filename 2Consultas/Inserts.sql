-- Inserts para la tabla usuarios
INSERT INTO usuarios(nombre, email, password, rol)
VALUES ('Juan David', 'almdavid26@gmail.com', 'perro', 'Vendedor');

INSERT INTO usuarios(nombre, email, password, rol)
VALUES ('Kevin Tadeo', 'tadeone@gmail.com', 'Perico', 'Comprador');

INSERT INTO usuarios(nombre, email, password, rol)
VALUES ('Maria Del Rayo', 'mari@gmail.com', 'Choco', 'Comprador');

-- Inserts para la tabla tiendas.
INSERT INTO tienda (nombre_tienda, descripcion, id_usuario)
VALUES ('Polleria', 'Tienda de carniceria', '3fa98e47-87ea-4d32-a2b4-51d83306069a');

-- Puse el mismo ID solo hice un cambio en una letra, y me dice que error de insercion o actualizacion ya que viola la llave foranea y que esta no esta presente
INSERT INTO tienda (nombre_tienda, descripcion, id_usuario)
VALUES ('Polleria', 'Tienda de carniceria', '3fa98e47-87aa-4d32-a2b4-51d83306069a');







