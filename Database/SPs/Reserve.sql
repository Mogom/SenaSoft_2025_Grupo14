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

DROP PROCEDURE `GetTicketByUser`

CALL `GetTicketByUser`(1)