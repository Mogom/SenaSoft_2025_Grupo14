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

