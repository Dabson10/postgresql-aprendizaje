/* En este script encontrarás diferentes tipos de insert ya sean
inserts individuales, inserts multiples, inserts por bloques y con usos
de variables.*/

-- =================== INSERTS INDIVIDUALES. ===================
-- Inserts para la tabla usuarios
INSERT INTO usuarios(nombre, email, password, rol)
VALUES ('Juan David', 'almdavid26@gmail.com', 'perro', 'Vendedor');

INSERT INTO usuarios(nombre, email, password, rol)
VALUES ('Kevin Tadeo', 'tadeone@gmail.com', 'Perico', 'Comprador');

INSERT INTO usuarios(nombre, email, password, rol)
VALUES ('Maria Del Rayo', 'mari@gmail.com', 'Choco', 'Comprador');

-- Inserts para la tabla tienda.
INSERT INTO tiendas (nombre_tienda, descripcion, id_usuario)
VALUES ('Polleria', 'Tienda de carniceria', '3fa98e47-87ea-4d32-a2b4-51d83306069a');

-- Puse el mismo ID solo hice un cambio en una letra, y me dice que error de inserción o actualización, ya que viola la llave foránea y que esta no está presente
-- INSERT INTO tiendas (nombre_tienda, descripcion, id_usuario)
-- VALUES ('Polleria', 'Tienda de carniceria', '3fa98e47-87aa-4d32-a2b4-51d83306069a');

--Otra tienda para hacer una prueba del 1:1
INSERT INTO tiendas (nombre_tienda, descripcion, id_usuario)
VALUES ('OXXO', 'Tienda de conveniencia.', '3fa98e47-87ea-4d32-a2b4-51d83306069a');
--Error de tener una tienda nueva con el mismo vendedor
  --[2026-07-30 20:59:10:076] [23505] ERROR: llave duplicada viola restricción de unicidad «tienda_id_usuario_key»
  --[2026-07-30 20:59:10:076] Detail: Ya existe la llave (id_usuario)=(3fa98e47-87ea-4d32-a2b4-51d83306069a).

-- Inserts para la tabla productos
INSERT INTO productos (nombre, descripcion, precio, stock, id_tienda)
VALUES ('Mineralita', 'Agua mineral de 600ml', 14.67, 20,'56c2d9e9-9021-47f8-94de-c7dea8e57049');
-- Un insert para meter más de 1 valor.
INSERT INTO productos (nombre, descripcion, precio, stock, id_tienda)
VALUES
    ('Topochico', 'Agua mineral de 600ml', 23.42, 15,'56c2d9e9-9021-47f8-94de-c7dea8e57049'),
    ('Takis fuego', 'Takis fuego de 56g', 22, 20,'56c2d9e9-9021-47f8-94de-c7dea8e57049');


-- =================== INSERTS MASIVOS ===================
-- Inserts a todas las tablas.
DO $$
    DECLARE
        -- Vendedores //Variables sobre las UUID para no poner una por una en el ID del usuario o tiendas.
        vendedor_tech     UUID := gen_random_uuid();
        vendedor_moda     UUID := gen_random_uuid();
        vendedor_hogar    UUID := gen_random_uuid();
        vendedor_deportes UUID := gen_random_uuid();
        vendedor_libros   UUID := gen_random_uuid();
        vendedor_gaming   UUID := gen_random_uuid();

        -- Compradores
        comprador_1 UUID := gen_random_uuid();
        comprador_2 UUID := gen_random_uuid();
        comprador_3 UUID := gen_random_uuid();
        comprador_4 UUID := gen_random_uuid();
        comprador_5 UUID := gen_random_uuid();

        -- Tiendas
        tienda_tech     UUID := gen_random_uuid();
        tienda_moda     UUID := gen_random_uuid();
        tienda_hogar    UUID := gen_random_uuid();
        tienda_deportes UUID := gen_random_uuid();
        tienda_libros   UUID := gen_random_uuid();
        tienda_gaming   UUID := gen_random_uuid();

    BEGIN

        -- 1. INSERTAR USUARIOS
        INSERT INTO usuarios (id, nombre, email, password, rol) VALUES
                                                                    -- Vendedores
                                                                    (vendedor_tech, 'Carlos Mendoza', 'carlos.mendoza@email.com', '$2a$12$eImiTXuWVxfM37uY4JANjO5E.1M3', 'Vendedor'),
                                                                    (vendedor_moda, 'Sofía Ramírez', 'sofia.ramirez@email.com', '$2a$12$eImiTXuWVxfM37uY4JANjO5E.1M3', 'Vendedor'),
                                                                    (vendedor_hogar, 'Alejandro Gómez', 'alejandro.gomez@email.com', '$2a$12$eImiTXuWVxfM37uY4JANjO5E.1M3', 'Vendedor'),
                                                                    (vendedor_deportes, 'Mariana Torres', 'mariana.torres@email.com', '$2a$12$eImiTXuWVxfM37uY4JANjO5E.1M3', 'Vendedor'),
                                                                    (vendedor_libros, 'Roberto Silva', 'roberto.silva@email.com', '$2a$12$eImiTXuWVxfM37uY4JANjO5E.1M3', 'Vendedor'),
                                                                    (vendedor_gaming, 'Daniela Vega', 'daniela.vega@email.com', '$2a$12$eImiTXuWVxfM37uY4JANjO5E.1M3', 'Vendedor'),
                                                                    -- Compradores
                                                                    (comprador_1, 'Ana Martínez', 'ana.martinez@email.com', '$2a$12$eImiTXuWVxfM37uY4JANjO5E.1M3', 'Comprador'),
                                                                    (comprador_2, 'Luis Hernández', 'luis.hernandez@email.com', '$2a$12$eImiTXuWVxfM37uY4JANjO5E.1M3', 'Comprador'),
                                                                    (comprador_3, 'Fernando Castillo', 'fernando.castillo@email.com', '$2a$12$eImiTXuWVxfM37uY4JANjO5E.1M3', 'Comprador'),
                                                                    (comprador_4, 'Valeria Morales', 'valeria.morales@email.com', '$2a$12$eImiTXuWVxfM37uY4JANjO5E.1M3', 'Comprador'),
                                                                    (comprador_5, 'Diego Navarro', 'diego.navarro@email.com', '$2a$12$eImiTXuWVxfM37uY4JANjO5E.1M3', 'Comprador');

        -- 2. INSERTAR TIENDAS
        INSERT INTO tiendas (id, nombre_tienda, descripcion, id_usuario) VALUES
                                                                             (tienda_tech, 'TechZone', 'Laptops, gadgets y tecnología de última generación.', vendedor_tech),
                                                                             (tienda_moda, 'Estilo Urbano', 'Ropa casual, cómoda y en tendencia.', vendedor_moda),
                                                                             (tienda_hogar, 'Hogar & Confort', 'Artículos de decoración, organización y cocina.', vendedor_hogar),
                                                                             (tienda_deportes, 'Fit & Motion', 'Equipamiento deportivo, accesorios de gym y calzado.', vendedor_deportes),
                                                                             (tienda_libros, 'El Rincón Lector', 'Libros de literatura, programación y desarrollo personal.', vendedor_libros),
                                                                             (tienda_gaming, 'Pixel Vault', 'Periféricos gaming, consolas y accesorios.', vendedor_gaming);

        -- 3. INSERTAR PRODUCTOS


        INSERT INTO productos (nombre, descripcion, precio, stock, id_tienda) VALUES
                                                                                  ('Audífonos Bluetooth Pro', 'Cancelación de ruido activa y autonomía de 24 horas.', 89.99, 15, tienda_tech),
                                                                                  ('Teclado Mecánico RGB', 'Switches rojos silenciosos y conexión USB-C.', 65.50, 20, tienda_tech),
                                                                                  ('Mouse Inalámbrico Ergonómico', 'Diseño ergonómico, DPI ajustable hasta 4000.', 29.90, 45, tienda_tech),
                                                                                  ('Monitor Gamer 24" 144Hz', 'Pantalla IPS Full HD con tiempo de respuesta de 1ms.', 199.99, 8, tienda_tech),
                                                                                  ('Soporte Ajustable para Laptop', 'Aluminio resistente para laptops de 11 a 17 pulgadas.', 24.00, 30, tienda_tech),
                                                                                  ('Hub USB-C 7 en 1', 'Salida HDMI 4K, puertos USB 3.0 y lector SD.', 35.50, 18, tienda_tech);


        INSERT INTO productos (nombre, descripcion, precio, stock, id_tienda) VALUES
                                                                                  ('Playera de Algodón Oversize', '100% algodón peinado, diseño unisex.', 19.99, 50, tienda_moda),
                                                                                  ('Sudadera con Capucha Classic', 'Interior afelpado muy suave.', 39.90, 25, tienda_moda),
                                                                                  ('Pantalón Jogger Cargo', 'Corte moderno con múltiples bolsillos.', 45.00, 18, tienda_moda),
                                                                                  ('Gorra Minimalista', 'Ajustable con broche metálico.', 14.50, 40, tienda_moda),
                                                                                  ('Chamarra Mezclilla Vintage', 'Estilo retro con botones metálicos.', 68.00, 12, tienda_moda),
                                                                                  ('Tenis Casuales Blanco', 'Suela de goma antideslizante, ajuste cómodo.', 59.99, 22, tienda_moda);


        INSERT INTO productos (nombre, descripcion, precio, stock, id_tienda) VALUES
                                                                                  ('Cafetera Prensa Francesa 1L', 'Cristal borosilicato y filtro de acero inoxidable.', 28.50, 12, tienda_hogar),
                                                                                  ('Lámpara de Escritorio LED', 'Control táctil con 3 niveles de brillo.', 22.00, 35, tienda_hogar),
                                                                                  ('Juego de Sábanas Matrimonial', 'Microfibra ultrasuave de 1800 hilos.', 34.99, 10, tienda_hogar),
                                                                                  ('Humidificador Ultrasónico', 'Capacidad 2.5L con difusor de aromas.', 31.00, 0, tienda_hogar), -- Sin stock
                                                                                  ('Set de Cuchillos de Cocina 5 pzas', 'Acero inoxidable con recubrimiento antiadherente.', 42.00, 15, tienda_hogar),
                                                                                  ('Organizador de Escritorio Madera', 'Diseño compacto con compartimentos múltiples.', 18.50, 25, tienda_hogar);


        INSERT INTO productos (nombre, descripcion, precio, stock, id_tienda) VALUES
                                                                                  ('Mano de Mancuernas 10kg Set', 'Recubrimiento de neopreno antideslizante.', 49.99, 14, tienda_deportes),
                                                                                  ('Tapete de Yoga Antideslizante', 'Grosor de 6mm, incluye correa de transporte.', 25.00, 30, tienda_deportes),
                                                                                  ('Cuerda para Saltar de Alta Velocidad', 'Baleros de rodamiento rápido y cable ajustable.', 12.99, 60, tienda_deportes),
                                                                                  ('Cilindro Térmico 1 Litro', 'Acero inoxidable, mantiene temperatura por 12 horas.', 19.50, 40, tienda_deportes),
                                                                                  ('Banda de Resistencia Set de 5', 'Diferentes niveles de tensión con bolsa incluida.', 15.00, 0, tienda_deportes); -- Sin stock


        INSERT INTO productos (nombre, descripcion, precio, stock, id_tienda) VALUES
                                                                                  ('Clean Code - Robert C. Martin', 'Manual de estilo para el desarrollo ágil de software.', 42.50, 10, tienda_libros),
                                                                                  ('Designing Data-Intensive Applications', 'Guía fundamental sobre arquitecturas de datos.', 55.00, 7, tienda_libros),
                                                                                  ('Cien Años de Soledad', 'Obra cumbre de Gabriel García Márquez.', 18.90, 20, tienda_libros),
                                                                                  ('Hábitos Atómicos - James Clear', 'Cambios pequeños, resultados extraordinarios.', 21.00, 35, tienda_libros),
                                                                                  ('El Señor de los Anillos (Trilogía)', 'Edición especial de tapa dura.', 75.00, 5, tienda_libros);


        INSERT INTO productos (nombre, descripcion, precio, stock, id_tienda) VALUES
                                                                                  ('Control Inalámbrico Pro', 'Compatible con PC y consolas, vibración HD.', 69.99, 16, tienda_gaming),
                                                                                  ('Silla Gamer Ergonómica', 'Soporte lumbar ajustable y reclinable 180°.', 189.00, 6, tienda_gaming),
                                                                                  ('Mousepad XL 90x40cm', 'Superficie de tela de baja fricción y bordes cosidos.', 16.50, 50, tienda_gaming),
                                                                                  ('Micrófono Condensador USB', 'Ideal para streaming y podcast, incluye filtro pop.', 54.90, 11, tienda_gaming),
                                                                                  ('Headset Gamer 7.1 Surround', 'Almohadillas de memory foam y micrófono retráctil.', 79.90, 13, tienda_gaming);

    END $$;
SELECT * FROM empleados_tienda;
--Agregar empleados en empleados_tienda

DO $$
    DECLARE
        empleado1 UUID := gen_random_uuid();
        empleado2 UUID := gen_random_uuid();
        empleado3 UUID := gen_random_uuid();
        empleado4 UUID := gen_random_uuid();
        empleado5 UUID := gen_random_uuid();
        empleado6 UUID := gen_random_uuid();
        empleado7 UUID := gen_random_uuid();
        empleado8 UUID := gen_random_uuid();
        empleado9  UUID := gen_random_uuid();
        empleado10 UUID := gen_random_uuid();

    BEGIN
        -- INSERT en la tabla de usuarios
        INSERT INTO usuarios(id, nombre, email, password, rol)
               VALUES (empleado1, 'Gabriel Fuentes', 'gabriel.fuentes@email.com', '$2a$12$eImiTXuWVxfM37uY4JANjO5E.1M3', 'Empleado'),
                      (empleado2, 'Camila Rivas', 'camila.rivas@email.com', '$2a$12$eImiTXuWVxfM37uY4JANjO5E.1M3', 'Empleado'),
                      (empleado3, 'Rodrigo Beltrán', 'rodrigo.beltran@email.com', '$2a$12$eImiTXuWVxfM37uY4JANjO5E.1M3', 'Empleado'),
                      (empleado4, 'Natalia Soto', 'natalia.soto@email.com', '$2a$12$eImiTXuWVxfM37uY4JANjO5E.1M3', 'Empleado'),
                      (empleado5, 'Javier Espinoza', 'javier.espinoza@email.com', '$2a$12$eImiTXuWVxfM37uY4JANjO5E.1M3', 'Empleado'),
                      (empleado6, 'Lucía Delgado', 'lucia.delgado@email.com', '$2a$12$eImiTXuWVxfM37uY4JANjO5E.1M3', 'Empleado'),
                      (empleado7, 'Esteban Paredes', 'esteban.paredes@email.com', '$2a$12$eImiTXuWVxfM37uY4JANjO5E.1M3', 'Empleado'),
                      (empleado8, 'Elena Valenzuela', 'elena.valenzuela@email.com', '$2a$12$eImiTXuWVxfM37uY4JANjO5E.1M3', 'Empleado'),
                      (empleado9,  'Mateo Benítez',   'mateo.benitez@email.com',   '$2a$12$eImiTXuWVxfM37uY4JANjO5E.1M3', 'Empleado'),
                      (empleado10, 'Valeria Ibarra',  'valeria.ibarra@email.com',  '$2a$12$eImiTXuWVxfM37uY4JANjO5E.1M3', 'Empleado');

        -- INSERT en la tabla de empleados_tienda
        INSERT INTO empleados_tienda(rol, id_usuario, id_tiendas)
            VALUES('Administrador', empleado1, '56c2d9e9-9021-47f8-94de-c7dea8e57049'),
                  ('Dueño', empleado2, 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44'),
                  ('Atencion_Cliente', empleado3, 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a55'),
                  ('Encargado_Inventario', empleado4, '355c86b0-e279-45ff-9b8d-b50b29037044'),
                  ('Dueño', empleado5, '355c86b0-e279-45ff-9b8d-b50b29037044'),
                  ('Administrador', empleado6, '61062630-a079-4e61-8cf6-638fd3bec1d2'),
                  ('Atencion_Cliente', empleado7, '6b490cd8-9cf6-4843-8412-e256200852fc'),
                  ('Encargado_Inventario', empleado8, '5ec1c2a7-cc50-42ae-9021-42381a14d3a9'),
                  ('Dueño',                empleado9,  'a021f423-2f53-48c7-8091-c2e771870531'),
                  ('Encargado_Inventario', empleado10, 'b8e1bae6-9b05-4f58-ad93-6c8207feb9bd');
    END$$;
