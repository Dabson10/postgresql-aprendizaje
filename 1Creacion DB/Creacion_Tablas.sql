
-- ==================  CREACIÓN DE ENUMS ================
-- Enum para usuarios
CREATE TYPE roles AS ENUM('Comprador', 'Vendedor');
-- Enum para rol_tiendas
CREATE TYPE rol_tiendas AS ENUM
    ('Dueño', 'Administrador', 'Encargado_Inventario', 'Atencion_cliente');

-- ===================  ALTERAR ENUMS ===================
--Si se necesita cambiar un valor de alguno de los dos ENUM es necesario
-- utilizar uno de los dos siguientes.
-- ALTER TYPE rol_tiendas RENAME VALUE 'Atención al cliente' TO 'Atencion_Cliente';
-- ALTER TYPE roles RENAME VALUE 'Vendedor' TO 'Empleado';

-- ===================  CREACIÓN DE TABLAS   ==================== --

-- Tabla usuarios.
CREATE TABLE usuarios(
-- Los IDs con UUID es el identificador de la fila, 
-- este se genera automaticamente en gen_random_uuid()
                         id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
                         nombre varchar(100) NOT NULL,
                         email varchar(100) NOT NULL UNIQUE,
                         password TEXT NOT NULL,
                         rol roles NOT NULL,
                         registro timestamptz DEFAULT now(),
                         actualizado_en timestamptz DEFAULT now(),
                         activo boolean DEFAULT TRUE
);
--Tabla relacionada á usuarios
/*Este tipo de relación de tienda a usuarios es una relación de
1:1 en donde los usuarios solo tienen una tienda, el porqué de
poner la FK en la parte de tiendas es porque la tienda depende totalmente
de un usuario para existir.*/
CREATE TABLE tiendas(
                       id UUID DEFAULT gen_random_uuid() PRIMARY KEY ,
                       nombre_tienda varchar(70) NOT NULL,
                       descripcion TEXT,
                       creacion TIMESTAMPTZ DEFAULT now(),
                       actualizado_en timestamptz DEFAULT now(),
                       id_usuario UUID UNIQUE NOT NULL,
                       CONSTRAINT id_usuario_pk_tienda FOREIGN KEY(id_usuario) REFERENCES usuarios(id)
);
-- Tabla relacionada á Tiendas
CREATE TABLE productos(
    ID UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    nombre varchar(70) NOT NULL,
    descripcion TEXT,
    precio NUMERIC(7,2) NOT NULL CHECK ( precio > 0 ),
    stock SMALLINT NOT NULL CHECK( stock >= 0),
    creado_en TIMESTAMPTZ DEFAULT now(),
    actualizado_en TIMESTAMPTZ DEFAULT now(),
    id_tienda UUID NOT NULL,
    CONSTRAINT fk_productos_id_tienda FOREIGN KEY(id_tienda) REFERENCES tiendas(id)
);

-- Tabla que relaciona a tiendas y usuarios.
CREATE TABLE empleados_tienda(
    ID UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    creado_en TIMESTAMPTZ DEFAULT now() ,
    actualizado_en TIMESTAMPTZ DEFAULT now(),
    rol rol_tiendas NOT NULL,
    id_usuario UUID UNIQUE NOT NULL,
    id_tiendas UUID  NOT NULL,
    CONSTRAINT fk_empleados_tienda_id_usuarios FOREIGN KEY(id_usuario) REFERENCES usuarios(id),
    CONSTRAINT fk_empleados_tienda_id_tienda FOREIGN KEY(id_tiendas) REFERENCES tiendas(id)
);