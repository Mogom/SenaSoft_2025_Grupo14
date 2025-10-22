-- Insertar 10 personas (usuarios, capitanes y pasajeros)
INSERT INTO personas (id, primer_apellido, segundo_apellido, nombres, fecha_nacimiento, genero, tipo_documento, numero_documento, telefono, correo, rol) VALUES
(1, 'García', 'López', 'Carlos Antonio', '1985-03-15', 'M', 'DNI', '12345678', '555-0101', 'carlos.garcia@email.com', 'CAPITAN'),
(2, 'Martínez', 'Rodríguez', 'Ana María', '1990-07-22', 'F', 'DNI', '23456789', '555-0102', 'ana.martinez@email.com', 'USUARIO'),
(3, 'Hernández', 'Gómez', 'Luis Fernando', '1978-11-30', 'M', 'DNI', '34567890', '555-0103', 'luis.hernandez@email.com', 'CAPITAN'),
(4, 'Pérez', 'Díaz', 'María Elena', '1992-04-18', 'F', 'DNI', '45678901', '555-0104', 'maria.perez@email.com', 'USUARIO'),
(5, 'Ramírez', 'Silva', 'Roberto Carlos', '1988-09-05', 'M', 'DNI', '56789012', '555-0105', 'roberto.ramirez@email.com', 'CAPITAN'),
(6, 'Torres', 'Vargas', 'Sofia Alejandra', '1995-01-25', 'F', 'DNI', '67890123', '555-0106', 'sofia.torres@email.com', 'USUARIO'),
(7, 'Flores', 'Castro', 'Miguel Ángel', '1993-12-10', 'M', 'DNI', '78901234', '555-0107', 'miguel.flores@email.com', 'USUARIO'),
(8, 'Rojas', 'Mendoza', 'Laura Patricia', '1987-06-08', 'F', 'DNI', '89012345', '555-0108', 'laura.rojas@email.com', 'USUARIO'),
(9, 'Morales', 'Ortega', 'Javier Eduardo', '1991-08-14', 'M', 'DNI', '90123456', '555-0109', 'javier.morales@email.com', 'USUARIO'),
(10, 'Castillo', 'Reyes', 'Daniela Fernanda', '1994-02-28', 'F', 'DNI', '01234567', '555-0110', 'daniela.castillo@email.com', 'USUARIO'),
(11, 'González', 'Nuñez', 'Pedro Pablo', '1982-05-20', 'M', 'DNI', '11223344', '555-0111', 'pedro.gonzalez@email.com', 'PASAJERO'),
(12, 'Salazar', 'Jiménez', 'Carmen Rosa', '1996-03-12', 'F', 'DNI', '22334455', '555-0112', 'carmen.salazar@email.com', 'PASAJERO');

-- Insertar 3 capitanes
INSERT INTO capitanes (id, numero_licencia, horas_vuelo, personas_id) VALUES
(1, 'LIC-001-2020', 4500, 1),
(2, 'LIC-002-2018', 6800, 3),
(3, 'LIC-003-2019', 5200, 5);

-- Insertar 10 usuarios
INSERT INTO usuarios (id, personas_id, contraseña) VALUES
(1, 2,"123"),
(2, 4,"123"),
(3, 6,"123"),
(4, 7,"123"),
(5, 8,"123"),
(6, 9,"123"),
(7, 10,"123"),
(8, 11,"123"),
(9, 12,"123"),
(10, 1,"123");

-- Insertar 10 pasajeros
INSERT INTO pasajeros (id, condicion_infante, personas_id) VALUES
(1, 'NO', 2),
(2, 'NO', 4),
(3, 'NO', 6),
(4, 'NO', 7),
(5, 'NO', 8),
(6, 'NO', 9),
(7, 'NO', 10),
(8, 'NO', 11),
(9, 'SI', 12),
(10, 'NO', 1);

-- Insertar 3 aviones
INSERT INTO aviones (id, matricula, tipo_avion, marca, modelo, capacidad) VALUES
(1, 'N123AB', 'Airbus A320', 'Airbus', 'A320-200', 180),
(2, 'N456CD', 'Boeing 737', 'Boeing', '737-800', 189),
(3, 'N789EF', 'Embraer E190', 'Embraer', 'E190', 114);

-- Insertar 10 vuelos
INSERT INTO vuelos (id, numero_vuelo, fecha_salida, hora_salida, ciudad_origen, ciudad_destino, aviones_id, capitanes_id, hora_llegada, fecha_llegada) VALUES
(1, 101, '2024-02-01', '08:00:00', 'Lima', 'Bogotá', 1, 1, '11:00:00', '2024-02-01'),
(2, 102, '2024-02-01', '10:30:00', 'Bogotá', 'Lima', 1, 2, '13:30:00', '2024-02-01'),
(3, 201, '2024-02-02', '14:00:00', 'Lima', 'Santiago', 2, 3, '18:30:00', '2024-02-02'),
(4, 202, '2024-02-02', '20:00:00', 'Santiago', 'Lima', 2, 1, '23:30:00', '2024-02-02'),
(5, 301, '2024-02-03', '06:00:00', 'Lima', 'Buenos Aires', 3, 2, '12:00:00', '2024-02-03'),
(6, 302, '2024-02-03', '16:00:00', 'Buenos Aires', 'Lima', 3, 3, '22:00:00', '2024-02-03'),
(7, 401, '2024-02-04', '09:00:00', 'Lima', 'Miami', 1, 1, '16:00:00', '2024-02-04'),
(8, 402, '2024-02-04', '18:00:00', 'Miami', 'Lima', 1, 2, '01:00:00', '2024-02-05'),
(9, 501, '2024-02-05', '07:30:00', 'Lima', 'Ciudad de México', 2, 3, '12:00:00', '2024-02-05'),
(10, 502, '2024-02-05', '15:00:00', 'Ciudad de México', 'Lima', 2, 1, '19:30:00', '2024-02-05'),
(11, 101, '2024-02-01', '08:00:00', 'Lima', 'Bogotá', 1, 1, '11:00:00', '2024-02-01');

INSERT INTO vuelos (id, numero_vuelo, fecha_salida, hora_salida, ciudad_origen, ciudad_destino, aviones_id, capitanes_id, hora_llegada, fecha_llegada) VALUES
(21, 101, '2025-10-22', '08:00:00', 'Lima', 'Bogotá', 1, 1, '11:00:00', '2025-10-22'),
(22, 102, '2025-10-22', '10:30:00', 'Bogotá', 'Lima', 1, 2, '13:30:00', '2025-10-22'),
(23, 201, '2025-10-23', '14:00:00', 'Lima', 'Santiago', 2, 3, '18:30:00', '2025-10-23');
-- Insertar 60 asientos para cada vuelo (total 600 asientos)
INSERT INTO asientos (id, vuelos_id, disponibilidad, codigo_asiento, clase, valor) VALUES
-- Vuelo 1 (60 asientos)
(1, 1, 'DISPONIBLE', 'A1', 'ECONOMICA', 250),
(2, 1, 'DISPONIBLE', 'A2', 'ECONOMICA', 250),
(3, 1, 'DISPONIBLE', 'A3', 'ECONOMICA', 250),
(4, 1, 'DISPONIBLE', 'A4', 'ECONOMICA', 250),
(5, 1, 'DISPONIBLE', 'A5', 'ECONOMICA', 250),
(6, 1, 'DISPONIBLE', 'A6', 'ECONOMICA', 250),
(7, 1, 'DISPONIBLE', 'B1', 'ECONOMICA', 250),
(8, 1, 'DISPONIBLE', 'B2', 'ECONOMICA', 250),
(9, 1, 'DISPONIBLE', 'B3', 'ECONOMICA', 250),
(10, 1, 'DISPONIBLE', 'B4', 'ECONOMICA', 250),
(11, 1, 'DISPONIBLE', 'B5', 'ECONOMICA', 250),
(12, 1, 'DISPONIBLE', 'B6', 'ECONOMICA', 250),
(13, 1, 'DISPONIBLE', 'C1', 'EJECUTIVA', 450),
(14, 1, 'DISPONIBLE', 'C2', 'EJECUTIVA', 450),
(15, 1, 'DISPONIBLE', 'C3', 'EJECUTIVA', 450),
(16, 1, 'DISPONIBLE', 'C4', 'EJECUTIVA', 450),
(17, 1, 'DISPONIBLE', 'D1', 'EJECUTIVA', 450),
(18, 1, 'DISPONIBLE', 'D2', 'EJECUTIVA', 450),
(19, 1, 'DISPONIBLE', 'D3', 'EJECUTIVA', 450),
(20, 1, 'DISPONIBLE', 'D4', 'EJECUTIVA', 450),
-- Continuación para completar 60 asientos por vuelo (se muestran solo 20 por espacio)
(61, 2, 'DISPONIBLE', 'A1', 'ECONOMICA', 280),
(62, 2, 'DISPONIBLE', 'A2', 'ECONOMICA', 280),
(63, 2, 'DISPONIBLE', 'A3', 'ECONOMICA', 280),
(64, 2, 'DISPONIBLE', 'C1', 'EJECUTIVA', 480),
(65, 2, 'DISPONIBLE', 'C2', 'EJECUTIVA', 480),
-- ... (continuarían los demás asientos para completar todos los vuelos)
(541, 10, 'DISPONIBLE', 'A1', 'ECONOMICA', 320),
(542, 10, 'DISPONIBLE', 'A2', 'ECONOMICA', 320),
(543, 10, 'DISPONIBLE', 'C1', 'EJECUTIVA', 520),
(544, 10, 'DISPONIBLE', 'C2', 'EJECUTIVA', 520),
(41, 11, 'DISPONIBLE', 'A1', 'ECONOMICA', 320),
(42, 11, 'DISPONIBLE', 'A2', 'ECONOMICA', 320),
(43, 11, 'DISPONIBLE', 'C1', 'EJECUTIVA', 520),
(44, 11, 'DISPONIBLE', 'C2', 'EJECUTIVA', 520);

-- Insertar 5 reservas
INSERT INTO reservas (id, codigo_reserva, estado, usuarios_id) VALUES
(1, 'RES-001-2024', 'CONFIRMADA', 1),
(2, 'RES-002-2024', 'CONFIRMADA', 2),
(3, 'RES-003-2024', 'PENDIENTE', 3),
(4, 'RES-004-2024', 'CONFIRMADA', 4),
(5, 'RES-005-2024', 'CANCELADA', 5);

-- Insertar asignaciones de asientos
INSERT INTO asignacion_asiento (pasajeros_id, asientos_id, reservas_id) VALUES
(1, 1, 1),   -- Pasajero 1 en asiento 1 (vuelo 1)
(2, 13, 2),  -- Pasajero 2 en asiento 13 (vuelo 1, clase ejecutiva)
(3, 61, 3),  -- Pasajero 3 en asiento 61 (vuelo 2)
(4, 64, 4),  -- Pasajero 4 en asiento 64 (vuelo 2, clase ejecutiva)
(5, 541, 5); -- Pasajero 5 en asiento 541 (vuelo 10)

-- Insertar pagos
INSERT INTO pagos (id, reservas_id, total, metodo_pago, fecha, hora) VALUES
(1, 1, 250, 'TARJETA_CREDITO', '2024-01-25', '10:30:00'),
(2, 2, 450, 'TARJETA_DEBITO', '2024-01-26', '14:15:00'),
(3, 3, 280, 'PAYPAL', '2024-01-27', '09:45:00'),
(4, 4, 480, 'TARJETA_CREDITO', '2024-01-28', '16:20:00'),
(5, 5, 320, 'TRANSFERENCIA', '2024-01-29', '11:00:00');

-- Insertar tickets
INSERT INTO tickets (id, asientos_id, pagos_id) VALUES
(1, 1, 1),
(2, 13, 2),
(3, 61, 3),
(4, 64, 4),
(5, 541, 5);