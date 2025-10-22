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


CREATE PROCEDURE RegisterUser (
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
    IN p_contraseña VARCHAR(100)
)
BEGIN
    DECLARE last_id INT;
    INSERT INTO personas (primer_apellido, segundo_apellido, nombres, fecha_nacimiento, genero, tipo_documento, numero_documento, telefono, correo, rol) 
    VALUES (p_primer_apellido,p_segundo_apellido,p_nombres,p_fecha_nacimiento,p_genero,p_tipo_documento,p_numero_documento,p_telefono,p_correo,p_rol);
    SET last_id = LAST_INSERT_ID ();

    INSERT INTO usuarios (personas_id,contraseña)
    VALUES(last_id, p_contraseña);
    SELECT * FROM usuarios WHERE id = LAST_INSERT_ID();
END

CREATE PROCEDURE SearchFlightsByUser(
    IN p_user_id INT
)
BEGIN
    SELECT 
        v.*,
        r.codigo_reserva,
        r.estado as estado_reserva,
        a.codigo_asiento,
        a.clase,
        a.valor,
        p.total as monto_pago,
        p.metodo_pago,
        CONCAT(per.nombres, ' ', per.primer_apellido) as nombre_pagador
    FROM vuelos v
    INNER JOIN asientos a ON v.id = a.vuelos_id
    INNER JOIN asignacion_asiento aa ON a.id = aa.asientos_id
    INNER JOIN pasajeros pas ON aa.pasajeros_id = pas.id
    INNER JOIN personas per ON pas.personas_id = per.id
    INNER JOIN reservas r ON aa.reservas_id = r.id
    INNER JOIN usuarios u ON r.usuarios_id = u.id
    LEFT JOIN pagos p ON r.id = p.reservas_id
    WHERE u.id = p_user_id
    ORDER BY v.fecha_salida DESC, v.hora_salida DESC;
END