CREATE PROCEDURE GetAllChairs ()
BEGIN 
    SELECT * FROM vuelos JOIN asientos ON asientos.vuelos_id = vuelos.id ;
END

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

CREATE PROCEDURE GetFreeChairs (
    IN p_fly_id INT
)
BEGIN
    SELECT * FROM asientos 
    WHERE asientos.vuelos_id = p_fly_id 
    AND asientos.disponibilidad = "DISPONIBLE";
END


