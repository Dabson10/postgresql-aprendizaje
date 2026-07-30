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

CREATE TABLE tienda(
                       id UUID DEFAULT gen_random_uuid() PRIMARY KEY ,
                       nombre_tienda varchar(70) NOT NULL,
                       descripcion TEXT,
                       creacion TIMESTAMPTZ DEFAULT now(),
                       actualizado_en timestamptz DEFAULT now(),
                       id_usuario UUID UNIQUE NOT NULL,
                       CONSTRAINT id_usuario_pk_tienda FOREIGN KEY(id_usuario) REFERENCES usuarios(id)
);