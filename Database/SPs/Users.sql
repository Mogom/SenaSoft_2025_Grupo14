-- Active: 1759201386306@@127.0.0.1@3306@GESTION_VUELOS

CREATE PROCEDURE GetAllUsers ()
BEGIN
    SELECT * FROM personas JOIN usuarios ON personas.id = usuarios.id ;
END


CREATE PROCEDURE GetUserBy (
    IN p_id INT
)
BEGIN
    SELECT * FROM personas JOIN usuarios ON personas.id = usuarios.id 
    WHERE usuarios.id = p_id;
END

CREATE PROCEDURE RegisterPerson (
    IN p_primer_apellido VARCHAR(75),
    IN p_segundo_apellido VARCHAR(75),
    IN p_nombres VARCHAR(100),
    IN p_fecha_nacimiento DATE,
    IN p_genero VARCHAR (45),
    IN p_tipo_documento VARCHAR (45),
    IN p_numero_documento VARCHAR (75),
    IN p_telefono VARCHAR (75),
    IN p_correo VARCHAR (75),
    IN p_rol VARCHAR (45)
)
BEGIN

    INSERT INTO personas (primer_apellido, segundo_apellido, nombres, fecha_nacimiento, genero, tipo_documento, numero_documento, telefono, correo, rol) 
    VALUES (p_primer_apellido,p_segundo_apellido,p_nombres,p_fecha_nacimiento,p_genero,p_tipo_documento,p_numero_documento,p_telefono,p_correo,p_rol);

    SELECT * FROM personas WHERE id = LAST_INSERT_ID();
END




/* CREATE PROCEDURE  */

