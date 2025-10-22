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

