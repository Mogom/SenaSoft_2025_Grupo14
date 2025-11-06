-- Active: 1761175326518@@127.0.0.1@3306@GESTION_VUELOS


CREATE PROCEDURE GetAllFlights ()
BEGIN
    SELECT * FROM vuelos;
END

CREATE PROCEDURE GetFlightById (
    IN p_id INT
)
BEGIN
    SELECT * FROM vuelos WHERE id = p_id;
END

CREATE PROCEDURE GetFlightByDate (
    IN p_date DATE
)
BEGIN
    SELECT * FROM vuelos WHERE fecha_salida = p_date;
END

CREATE PROCEDURE GetFlightsNear2Months (
    IN p_date DATE
)
BEGIN
    SELECT * FROM vuelos WHERE fecha_salida BETWEEN p_date AND DATE_ADD(p_date, INTERVAL 2 MONTH);
END


CREATE PROCEDURE GetAllChairs (
    IN p_fly_id INT
)
BEGIN
    SELECT * FROM asientos 
    WHERE asientos.vuelos_id = p_fly_id;
END

CREATE PROCEDURE GetFreeChairs (
    IN p_fly_id INT
)
BEGIN
    SELECT * FROM asientos 
    WHERE asientos.vuelos_id = p_fly_id 
    AND asientos.disponibilidad = "DISPONIBLE";
END


CREATE PROCEDURE GetFreeChairsCount (
    IN p_id INT
)
BEGIN
    SELECT COUNT(*) as asientos_disponibles
    FROM asientos a
    WHERE a.disponibilidad = 'DISPONIBLE'
    AND a.vuelos_id = p_id; 
END

CALL `GetFreeChairsCount`(4)

CREATE PROCEDURE GetFlightByForm(
    IN p_origen VARCHAR(45),
    IN p_destino VARCHAR(45),
    IN p_fecha DATE,
    IN p_sillas_can INT
)
BEGIN
    SELECT v.* 
    FROM vuelos v
    WHERE v.ciudad_origen = p_origen
    AND v.ciudad_destino = p_destino
    AND v.fecha_salida = p_fecha
    AND p_sillas_can <= (
        SELECT COUNT(*) 
        FROM asientos a 
        WHERE a.disponibilidad = 'DISPONIBLE'
        AND a.vuelos_id = v.id 
    );
END

CALL GetFlightByForm('Lima', 'Bogotá', '2024-02-01', 1);
