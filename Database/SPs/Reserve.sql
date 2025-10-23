CREATE PROCEDURE GetTicket (
    IN p_ticket_id INT
)
BEGIN
    SELECT a.*,
    per.*,
    t.id
    FROM tickets t 
    JOIN asientos a ON a.id = t.asientos_id
    JOIN pagos p ON p.id = t.pagos_id
    JOIN reservas r ON p.reservas_id = r.id
    JOIN asignacion_asiento aa ON aa.reservas_id = r.id
    JOIN pasajeros ps ON ps.id = aa.pasajeros_id
    JOIN personas per ON ps.personas_id = per.id
    WHERE t.id = p_ticket_id;
END


CREATE PROCEDURE GetTicketByUser (
    IN p_user_id INT
)
BEGIN
    SELECT a.*,
    per.*,
    v.ciudad_origen,
    v.ciudad_destino,
    v.fecha_salida,
    v.hora_salida,
    v.hora_llegada,
    v.fecha_llegada,
    v.numero_vuelo,
    r.codigo_reserva,
    t.id as ticket_id
    FROM tickets t 
    JOIN asientos a ON a.id = t.asientos_id
    JOIN pagos p ON p.id = t.pagos_id
    JOIN reservas r ON p.reservas_id = r.id
    JOIN asignacion_asiento aa ON aa.reservas_id = r.id
    JOIN pasajeros ps ON ps.id = aa.pasajeros_id
    JOIN personas per ON ps.personas_id = per.id
    JOIN vuelos v ON a.vuelos_id = v.id
    WHERE r.usuarios_id = p_user_id;
END

CREATE PROCEDURE RegistrarReservaConPasajeros(
    -- Datos del usuario que realiza la reserva
    IN p_usuario_id INT,
    
    -- Datos del pago
    IN p_total DECIMAL(10,0),
    IN p_metodo_pago VARCHAR(100),
    
    -- Datos de los pasajeros (hasta 5) como JSON
    IN p_pasajeros_json JSON,
    
    -- IDs de los asientos para cada pasajero
    IN p_asientos_json JSON
)
BEGIN
    DECLARE v_reserva_id INT;
    DECLARE v_pago_id INT;
    DECLARE v_codigo_reserva VARCHAR(100);
    DECLARE v_num_pasajeros INT;
    DECLARE v_index INT DEFAULT 0;
    DECLARE v_persona_id INT;
    DECLARE v_pasajero_id INT;
    DECLARE v_asiento_id INT;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    -- Validar que hay al menos 1 pasajero
    SET v_num_pasajeros = JSON_LENGTH(p_pasajeros_json);
    IF v_num_pasajeros < 1 OR v_num_pasajeros > 5 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Debe haber entre 1 y 5 pasajeros';
    END IF;

    -- Validar que el número de asientos coincide con el número de pasajeros
    IF v_num_pasajeros != JSON_LENGTH(p_asientos_json) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El número de asientos no coincide con el número de pasajeros';
    END IF;

    START TRANSACTION;

    -- Generar código de reserva único
    SET v_codigo_reserva = CONCAT('RES', DATE_FORMAT(NOW(), '%Y%m%d'), LPAD(FLOOR(RAND() * 10000), 4, '0'));

    -- 1. Crear la reserva
    INSERT INTO reservas (codigo_reserva, estado, usuarios_id)
    VALUES (v_codigo_reserva, 'confirmada', p_usuario_id);
    
    SET v_reserva_id = LAST_INSERT_ID();

    -- 2. Registrar el pago
    INSERT INTO pagos (reservas_id, total, metodo_pago, fecha, hora)
    VALUES (v_reserva_id, p_total, p_metodo_pago, CURDATE(), CURTIME());
    
    SET v_pago_id = LAST_INSERT_ID();

    -- 3. Procesar cada pasajero
    WHILE v_index < v_num_pasajeros DO
        -- Registrar persona
        INSERT INTO personas (
            primer_apellido, segundo_apellido, nombres, fecha_nacimiento, 
            genero, tipo_documento, numero_documento, telefono, correo, rol
        ) VALUES (
            JSON_UNQUOTE(JSON_EXTRACT(p_pasajeros_json, CONCAT('$[', v_index, '].primer_apellido'))),
            JSON_UNQUOTE(JSON_EXTRACT(p_pasajeros_json, CONCAT('$[', v_index, '].segundo_apellido'))),
            JSON_UNQUOTE(JSON_EXTRACT(p_pasajeros_json, CONCAT('$[', v_index, '].nombres'))),
            JSON_UNQUOTE(JSON_EXTRACT(p_pasajeros_json, CONCAT('$[', v_index, '].fecha_nacimiento'))),
            JSON_UNQUOTE(JSON_EXTRACT(p_pasajeros_json, CONCAT('$[', v_index, '].genero'))),
            JSON_UNQUOTE(JSON_EXTRACT(p_pasajeros_json, CONCAT('$[', v_index, '].tipo_documento'))),
            JSON_UNQUOTE(JSON_EXTRACT(p_pasajeros_json, CONCAT('$[', v_index, '].numero_documento'))),
            JSON_UNQUOTE(JSON_EXTRACT(p_pasajeros_json, CONCAT('$[', v_index, '].telefono'))),
            JSON_UNQUOTE(JSON_EXTRACT(p_pasajeros_json, CONCAT('$[', v_index, '].correo'))),
            'pasajero'
        );
        
        SET v_persona_id = LAST_INSERT_ID();

        -- Registrar pasajero
        INSERT INTO pasajeros (condicion_infante, personas_id)
        VALUES (
            JSON_UNQUOTE(JSON_EXTRACT(p_pasajeros_json, CONCAT('$[', v_index, '].condicion_infante'))),
            v_persona_id
        );
        
        SET v_pasajero_id = LAST_INSERT_ID();

        -- Obtener asiento para este pasajero
        SET v_asiento_id = JSON_EXTRACT(p_asientos_json, CONCAT('$[', v_index, ']'));

        -- Asignar asiento y crear ticket
        CALL AsignarPasajeroYAsiento(v_pasajero_id, v_asiento_id, v_reserva_id, v_pago_id);

        SET v_index = v_index + 1;
    END WHILE;

    COMMIT;
    
    -- Devolver el código de reserva
    SELECT v_codigo_reserva AS codigo_reserva, v_reserva_id AS reserva_id;
END 
