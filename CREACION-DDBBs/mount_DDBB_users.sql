--============================================================== DDBB users ===============================================================================

-- Crea la base de datos
-- CREATE DATABASE users; -- Esto en tal caso de que se hiciera por terminal para crear la DDBB

-- Conéctate a la base de datos
-- \c appusers; -- (Desde Terminal)

-- Crea la tabla de usuarios
DROP TABLE IF EXISTS usuarios;
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    email VARCHAR(120) UNIQUE NOT NULL,
    usuario VARCHAR(128) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    estado BOOLEAN DEFAULT TRUE,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    rol VARCHAR(10) DEFAULT 'user',
    ultimo_login TIMESTAMP
);

-- Añadir la columna "Cookie" a la tabla usuarios
ALTER TABLE usuarios ADD COLUMN cookie VARCHAR(255) UNIQUE;
