-- Active: 1761175326518@@127.0.0.1@3306@GESTION_VUELOS
CREATE PROCEDURE RegisterPassenger(
    IN p_primer_apellido VARCHAR(75),
    IN p_segundo_apellido VARCHAR(75),
    IN p_nombres VARCHAR(100),
    IN p_fecha_nacimiento DATE,
    IN p_genero VARCHAR (45),
    IN p_tipo_documento VARCHAR (45),
    IN p_numero_documento VARCHAR (75),
    IN p_telefono VARCHAR (75),
    IN p_correo VARCHAR (75),
    IN p_rol VARCHAR (45),
    IN p_condicion_infante VARCHAR(45)
)
BEGIN 

    DECLARE last_person INT;

    INSERT INTO personas (primer_apellido, segundo_apellido, nombres, fecha_nacimiento, genero, tipo_documento, numero_documento, telefono, correo, rol) 
    VALUES (p_primer_apellido,p_segundo_apellido,p_nombres,p_fecha_nacimiento,p_genero,p_tipo_documento,p_numero_documento,p_telefono,p_correo,p_rol);
    SET last_person = LAST_INSERT_ID();

    INSERT INTO pasajeros (condicion_infante, personas_id)
    VALUES (p_condicion_infante, last_person);

    SELECT * FROM pasajeros WHERE id = (LAST_INSERT_ID());
END

CREATE PROCEDURE RegistReserve (
    IN p_user_id INT,
    IN p_codigo_reserva VARCHAR (50),
    IN p_estado VARCHAR (50)
)
BEGIN
   INSERT INTO reservas(codigo_reserva,estado,usuarios_id)
   VALUES (p_codigo_reserva, p_estado, p_user_id);
END

