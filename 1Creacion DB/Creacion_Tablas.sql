CREATE TYPE roles AS ENUM('Comprador', 'Vendedor');
-- Tabla usuarios.
CREATE TABLE usuarios(
                         id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
                         nombre varchar(100) NOT NULL,
                         email varchar(100) NOT NULL UNIQUE,
                         password TEXT NOT NULL,
                         rol roles,
                         registro timestamptz DEFAULT now(),
                         actualizado_en timestamptz DEFAULT now(),
                         activo boolean DEFAULT TRUE
);

CREATE TABLE tiendas(
                       id UUID DEFAULT gen_random_uuid() PRIMARY KEY ,
                       nombre_tienda varchar(70) NOT NULL,
                       descripcion TEXT,
                       creacion TIMESTAMPTZ DEFAULT now(),
                       actualizado_en timestamptz DEFAULT now(),
                       id_usuario UUID UNIQUE NOT NULL,
                       CONSTRAINT id_usuario_pk_tienda FOREIGN KEY(id_usuario) REFERENCES usuarios(id)
);

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