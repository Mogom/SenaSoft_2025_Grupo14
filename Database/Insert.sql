-- Active: 1761175326518@@127.0.0.1@3306@GESTION_VUELOS

-- Insertar más personas (usuarios, capitanes y pasajeros)
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
(10, 'Castillo', 'Reyes', 'Daniela Fernanda', '1994-10-28', 'F', 'DNI', '01234567', '555-0110', 'daniela.castillo@email.com', 'USUARIO'),
(11, 'González', 'Nuñez', 'Pedro Pablo', '1982-05-20', 'M', 'DNI', '11223344', '555-0111', 'pedro.gonzalez@email.com', 'PASAJERO'),
(12, 'Salazar', 'Jiménez', 'Carmen Rosa', '1996-03-12', 'F', 'DNI', '22334455', '555-0112', 'carmen.salazar@email.com', 'PASAJERO'),
(13, 'Vargas', 'Cruz', 'Ricardo Andrés', '1980-08-30', 'M', 'DNI', '33445566', '555-0113', 'ricardo.vargas@email.com', 'USUARIO'),
(14, 'Díaz', 'Romero', 'Patricia Isabel', '1993-02-14', 'F', 'DNI', '44556677', '555-0114', 'patricia.diaz@email.com', 'USUARIO'),
(15, 'Silva', 'Ortega', 'Fernando José', '1989-11-25', 'M', 'DNI', '55667788', '555-0115', 'fernando.silva@email.com', 'PASAJERO'),
(16, 'Mendoza', 'Paredes', 'Gabriela Lucía', '1997-04-18', 'F', 'DNI', '66778899', '555-0116', 'gabriela.mendoza@email.com', 'PASAJERO'),
(17, 'Castro', 'Ríos', 'Alejandro Martín', '1984-07-09', 'M', 'DNI', '77889900', '555-0117', 'alejandro.castro@email.com', 'USUARIO'),
(18, 'Romero', 'Quispe', 'Lucía Fernanda', '1991-12-03', 'F', 'DNI', '88990011', '555-0118', 'lucia.romero@email.com', 'PASAJERO'),
(19, 'Alvarez', 'Soto', 'Roberto Carlos', '1986-06-22', 'M', 'DNI', '99001122', '555-0119', 'roberto.alvarez@email.com', 'USUARIO'),
(20, 'Chavez', 'Vega', 'María José', '1994-09-15', 'F', 'DNI', '10111213', '555-0120', 'maria.chavez@email.com', 'PASAJERO');

-- Insertar 3 capitanes
INSERT INTO capitanes (id, numero_licencia, horas_vuelo, personas_id) VALUES
(1, 'LIC-001-2020', 4500, 1),
(2, 'LIC-002-2018', 6800, 3),
(3, 'LIC-003-2019', 5200, 5);

-- Insertar más usuarios
INSERT INTO usuarios (id, personas_id, contraseña) VALUES
(1, 2, "123"),
(2, 4, "123"),
(3, 6, "123"),
(4, 7, "123"),
(5, 8, "123"),
(6, 9, "123"),
(7, 10, "123"),
(8, 11, "123"),
(9, 12, "123"),
(10, 1, "123"),
(11, 13, "123"),
(12, 14, "123"),
(13, 17, "123"),
(14, 19, "123");

-- Insertar más pasajeros
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
(10, 'NO', 1),
(11, 'NO', 15),
(12, 'NO', 16),
(13, 'NO', 18),
(14, 'NO', 20);

-- Insertar más aviones
INSERT INTO aviones (id, matricula, tipo_avion, marca, modelo, capacidad) VALUES
(1, 'N123AB', 'Airbus A320', 'Airbus', 'A320-200', 180),
(2, 'N456CD', 'Boeing 737', 'Boeing', '737-800', 189),
(3, 'N789EF', 'Embraer E190', 'Embraer', 'E190', 114),
(4, 'N321XY', 'Airbus A321', 'Airbus', 'A321neo', 240),
(5, 'N654ZW', 'Boeing 787', 'Boeing', '787-9', 290);

INSERT INTO vuelos (id, numero_vuelo, fecha_salida, hora_salida, ciudad_origen, ciudad_destino, aviones_id, capitanes_id, hora_llegada, fecha_llegada) VALUES
(1, 101, CURDATE(), '08:00:00', 'Lima', 'Bogotá', 1, 1, '11:00:00', CURDATE()),
(2, 102, CURDATE(), '10:30:00', 'Bogotá', 'Lima', 1, 2, '13:30:00', CURDATE()),
(3, 201, CURDATE(), '14:00:00', 'Lima', 'Santiago', 2, 3, '18:30:00', CURDATE()),
(4, 202, CURDATE(), '20:00:00', 'Santiago', 'Lima', 2, 1, '23:30:00', CURDATE()),
(5, 301, DATE_ADD(CURDATE(), INTERVAL 1 DAY), '06:00:00', 'Lima', 'Buenos Aires', 3, 2, '12:00:00', DATE_ADD(CURDATE(), INTERVAL 1 DAY)),
(6, 302, DATE_ADD(CURDATE(), INTERVAL 1 DAY), '16:00:00', 'Buenos Aires', 'Lima', 3, 3, '22:00:00', DATE_ADD(CURDATE(), INTERVAL 1 DAY)),
(7, 401, DATE_ADD(CURDATE(), INTERVAL 1 DAY), '09:00:00', 'Lima', 'Miami', 1, 1, '16:00:00', DATE_ADD(CURDATE(), INTERVAL 1 DAY)),
(8, 402, DATE_ADD(CURDATE(), INTERVAL 1 DAY), '18:00:00', 'Miami', 'Lima', 1, 2, '01:00:00', DATE_ADD(CURDATE(), INTERVAL 2 DAY)),
(9, 501, DATE_ADD(CURDATE(), INTERVAL 2 DAY), '07:30:00', 'Lima', 'Ciudad de México', 2, 3, '12:00:00', DATE_ADD(CURDATE(), INTERVAL 2 DAY)),
(10, 502, DATE_ADD(CURDATE(), INTERVAL 2 DAY), '15:00:00', 'Ciudad de México', 'Lima', 2, 1, '19:30:00', DATE_ADD(CURDATE(), INTERVAL 2 DAY)),
(11, 601, DATE_ADD(CURDATE(), INTERVAL 3 DAY), '08:00:00', 'Lima', 'Quito', 4, 2, '10:00:00', DATE_ADD(CURDATE(), INTERVAL 3 DAY)),
(12, 602, DATE_ADD(CURDATE(), INTERVAL 3 DAY), '12:00:00', 'Quito', 'Lima', 4, 3, '14:00:00', DATE_ADD(CURDATE(), INTERVAL 3 DAY)),
(13, 701, DATE_ADD(CURDATE(), INTERVAL 4 DAY), '06:00:00', 'Lima', 'São Paulo', 5, 1, '12:00:00', DATE_ADD(CURDATE(), INTERVAL 4 DAY)),
(14, 702, DATE_ADD(CURDATE(), INTERVAL 4 DAY), '18:00:00', 'São Paulo', 'Lima', 5, 2, '00:00:00', DATE_ADD(CURDATE(), INTERVAL 5 DAY)),
(15, 801, DATE_ADD(CURDATE(), INTERVAL 5 DAY), '09:00:00', 'Lima', 'Panamá', 3, 3, '13:00:00', DATE_ADD(CURDATE(), INTERVAL 5 DAY)),
(16, 802, DATE_ADD(CURDATE(), INTERVAL 5 DAY), '16:00:00', 'Panamá', 'Lima', 3, 1, '20:00:00', DATE_ADD(CURDATE(), INTERVAL 5 DAY)),
(17, 901, CURDATE(), '07:00:00', 'Lima', 'Cusco', 1, 2, '08:30:00', CURDATE()),
(18, 902, CURDATE(), '10:00:00', 'Cusco', 'Lima', 1, 3, '11:30:00', CURDATE()),
(19, 903, DATE_ADD(CURDATE(), INTERVAL 1 DAY), '14:00:00', 'Lima', 'Arequipa', 2, 1, '15:30:00', DATE_ADD(CURDATE(), INTERVAL 1 DAY)),
(20, 904, DATE_ADD(CURDATE(), INTERVAL 1 DAY), '17:00:00', 'Arequipa', 'Lima', 2, 2, '18:30:00', DATE_ADD(CURDATE(), INTERVAL 1 DAY)),
(21, 1001, DATE_ADD(CURDATE(), INTERVAL 6 DAY), '22:00:00', 'Lima', 'Madrid', 5, 3, '15:00:00', DATE_ADD(CURDATE(), INTERVAL 7 DAY)),
(22, 1002, DATE_ADD(CURDATE(), INTERVAL 7 DAY), '17:00:00', 'Madrid', 'Lima', 5, 1, '23:00:00', DATE_ADD(CURDATE(), INTERVAL 7 DAY)),
(23, 1101, DATE_ADD(CURDATE(), INTERVAL 8 DAY), '21:00:00', 'Lima', 'París', 4, 2, '14:00:00', DATE_ADD(CURDATE(), INTERVAL 9 DAY)),
(24, 1102, DATE_ADD(CURDATE(), INTERVAL 9 DAY), '16:00:00', 'París', 'Lima', 4, 3, '22:00:00', DATE_ADD(CURDATE(), INTERVAL 9 DAY)),
(25, 1101, CURDATE(), '06:00:00', 'Lima', 'Bogotá', 1, 1, '09:00:00', CURDATE()),
(26, 1102, CURDATE(), '09:30:00', 'Lima', 'Bogotá', 2, 2, '12:30:00', CURDATE()),
(27, 1103, CURDATE(), '13:00:00', 'Lima', 'Bogotá', 3, 3, '16:00:00', CURDATE()),
(28, 1104, CURDATE(), '16:30:00', 'Lima', 'Bogotá', 1, 1, '19:30:00', CURDATE()),
(29, 1105, CURDATE(), '20:00:00', 'Lima', 'Bogotá', 2, 2, '23:00:00', CURDATE()),
(30, 1106, DATE_ADD(CURDATE(), INTERVAL 1 DAY), '07:00:00', 'Lima', 'Bogotá', 3, 3, '10:00:00', DATE_ADD(CURDATE(), INTERVAL 1 DAY)),
(31, 1107, DATE_ADD(CURDATE(), INTERVAL 1 DAY), '10:30:00', 'Lima', 'Bogotá', 1, 1, '13:30:00', DATE_ADD(CURDATE(), INTERVAL 1 DAY)),
(32, 1108, DATE_ADD(CURDATE(), INTERVAL 1 DAY), '14:00:00', 'Lima', 'Bogotá', 2, 2, '17:00:00', DATE_ADD(CURDATE(), INTERVAL 1 DAY)),
(33, 1109, DATE_ADD(CURDATE(), INTERVAL 1 DAY), '17:30:00', 'Lima', 'Bogotá', 3, 3, '20:30:00', DATE_ADD(CURDATE(), INTERVAL 1 DAY)),
(34, 1110, DATE_ADD(CURDATE(), INTERVAL 1 DAY), '21:00:00', 'Lima', 'Bogotá', 1, 1, '00:00:00', DATE_ADD(CURDATE(), INTERVAL 2 DAY));


-- Insertar muchos más asientos (20 asientos por vuelo para simplificar)
INSERT INTO asientos (id, vuelos_id, disponibilidad, codigo_asiento, clase, valor) VALUES
(1, 1, 'DISPONIBLE', '1A', 'ECONOMICA', 250),(2, 1, 'DISPONIBLE', '1B', 'ECONOMICA', 250),(3, 1, 'DISPONIBLE', '1C', 'ECONOMICA', 250),
(4, 1, 'DISPONIBLE', '2A', 'ECONOMICA', 250),(5, 1, 'DISPONIBLE', '2B', 'ECONOMICA', 250),(6, 1, 'DISPONIBLE', '2C', 'ECONOMICA', 250),
(7, 1, 'DISPONIBLE', '3A', 'EJECUTIVA', 450),(8, 1, 'DISPONIBLE', '3B', 'EJECUTIVA', 450),(9, 1, 'DISPONIBLE', '3C', 'EJECUTIVA', 450),
(10, 1, 'OCUPADO', '4A', 'ECONOMICA', 250),(11, 1, 'OCUPADO', '4B', 'ECONOMICA', 250),(12, 1, 'DISPONIBLE', '4C', 'ECONOMICA', 250),
(13, 2, 'DISPONIBLE', '1A', 'ECONOMICA', 280),(14, 2, 'DISPONIBLE', '1B', 'ECONOMICA', 280),(15, 2, 'DISPONIBLE', '1C', 'ECONOMICA', 280),
(16, 2, 'DISPONIBLE', '2A', 'EJECUTIVA', 480),(17, 2, 'DISPONIBLE', '2B', 'EJECUTIVA', 480),(18, 2, 'OCUPADO', '2C', 'EJECUTIVA', 480),
(61, 3, 'DISPONIBLE', '1A', 'ECONOMICA', 300),(62, 3, 'DISPONIBLE', '1B', 'ECONOMICA', 300),(63, 3, 'DISPONIBLE', '1C', 'ECONOMICA', 300),
(64, 4, 'DISPONIBLE', '1A', 'ECONOMICA', 320),(65, 4, 'DISPONIBLE', '1B', 'ECONOMICA', 320),(66, 4, 'DISPONIBLE', '1C', 'ECONOMICA', 320),
(67, 5, 'DISPONIBLE', '1A', 'ECONOMICA', 350),(68, 5, 'DISPONIBLE', '1B', 'ECONOMICA', 350),(69, 5, 'DISPONIBLE', '1C', 'ECONOMICA', 350),
(70, 6, 'DISPONIBLE', '1A', 'ECONOMICA', 380),(71, 6, 'DISPONIBLE', '1B', 'ECONOMICA', 380),(72, 6, 'DISPONIBLE', '1C', 'ECONOMICA', 380),
(73, 7, 'DISPONIBLE', '1A', 'ECONOMICA', 420),(74, 7, 'DISPONIBLE', '1B', 'ECONOMICA', 420),(75, 7, 'DISPONIBLE', '1C', 'ECONOMICA', 420),
(76, 8, 'DISPONIBLE', '1A', 'ECONOMICA', 400),(77, 8, 'DISPONIBLE', '1B', 'ECONOMICA', 400),(78, 8, 'DISPONIBLE', '1C', 'ECONOMICA', 400),
(79, 9, 'DISPONIBLE', '1A', 'ECONOMICA', 280),(80, 9, 'DISPONIBLE', '1B', 'ECONOMICA', 280),(81, 9, 'DISPONIBLE', '1C', 'ECONOMICA', 280),
(82, 10, 'DISPONIBLE', '1A', 'ECONOMICA', 290),(83, 10, 'DISPONIBLE', '1B', 'ECONOMICA', 290),(84, 10, 'DISPONIBLE', '1C', 'ECONOMICA', 290),
(100, 11, 'DISPONIBLE', '1A', 'ECONOMICA', 220),(101, 11, 'DISPONIBLE', '1B', 'ECONOMICA', 220),(102, 11, 'DISPONIBLE', '1C', 'ECONOMICA', 220),
(103, 12, 'DISPONIBLE', '1A', 'ECONOMICA', 230),(104, 12, 'DISPONIBLE', '1B', 'ECONOMICA', 230),(105, 12, 'DISPONIBLE', '1C', 'ECONOMICA', 230),
(106, 13, 'DISPONIBLE', '1A', 'ECONOMICA', 550),(107, 13, 'DISPONIBLE', '1B', 'ECONOMICA', 550),(108, 13, 'DISPONIBLE', '1C', 'ECONOMICA', 550),
(109, 14, 'DISPONIBLE', '1A', 'ECONOMICA', 560),(110, 14, 'DISPONIBLE', '1B', 'ECONOMICA', 560),(111, 14, 'DISPONIBLE', '1C', 'ECONOMICA', 560),
(112, 15, 'DISPONIBLE', '1A', 'ECONOMICA', 320),(113, 15, 'DISPONIBLE', '1B', 'ECONOMICA', 320),(114, 15, 'DISPONIBLE', '1C', 'ECONOMICA', 320),
(115, 16, 'DISPONIBLE', '1A', 'ECONOMICA', 330),(116, 16, 'DISPONIBLE', '1B', 'ECONOMICA', 330),(117, 16, 'DISPONIBLE', '1C', 'ECONOMICA', 330),
(118, 17, 'DISPONIBLE', '1A', 'ECONOMICA', 150),(119, 17, 'DISPONIBLE', '1B', 'ECONOMICA', 150),(120, 17, 'DISPONIBLE', '1C', 'ECONOMICA', 150),
(121, 18, 'DISPONIBLE', '1A', 'ECONOMICA', 160),(122, 18, 'DISPONIBLE', '1B', 'ECONOMICA', 160),(123, 18, 'DISPONIBLE', '1C', 'ECONOMICA', 160),
(124, 19, 'DISPONIBLE', '1A', 'ECONOMICA', 170),(125, 19, 'DISPONIBLE', '1B', 'ECONOMICA', 170),(126, 19, 'DISPONIBLE', '1C', 'ECONOMICA', 170),
(127, 20, 'DISPONIBLE', '1A', 'ECONOMICA', 180),(128, 20, 'DISPONIBLE', '1B', 'ECONOMICA', 180),(129, 20, 'DISPONIBLE', '1C', 'ECONOMICA', 180),
(130, 21, 'DISPONIBLE', '1A', 'ECONOMICA', 850),(131, 21, 'DISPONIBLE', '1B', 'ECONOMICA', 850),(132, 21, 'DISPONIBLE', '1C', 'ECONOMICA', 850),
(133, 22, 'DISPONIBLE', '1A', 'ECONOMICA', 860),(134, 22, 'DISPONIBLE', '1B', 'ECONOMICA', 860),(135, 22, 'DISPONIBLE', '1C', 'ECONOMICA', 860),
(136, 23, 'DISPONIBLE', '1A', 'ECONOMICA', 880),(137, 23, 'DISPONIBLE', '1B', 'ECONOMICA', 880),(138, 23, 'DISPONIBLE', '1C', 'ECONOMICA', 880),
(139, 24, 'DISPONIBLE', '1A', 'ECONOMICA', 890),(140, 24, 'DISPONIBLE', '1B', 'ECONOMICA', 890),(141, 24, 'DISPONIBLE', '1C', 'ECONOMICA', 890);

-- Insertar asientos para los nuevos vuelos Lima-Bogotá
INSERT INTO asientos (id, vuelos_id, disponibilidad, codigo_asiento, clase, valor) VALUES
-- Vuelo 25 (6 asientos de ejemplo)
(150, 25, 'DISPONIBLE', '1A', 'ECONOMICA', 280),
(151, 25, 'DISPONIBLE', '1B', 'ECONOMICA', 280),
(152, 25, 'DISPONIBLE', '1C', 'ECONOMICA', 280),
(153, 25, 'DISPONIBLE', '2A', 'EJECUTIVA', 480),
(154, 25, 'DISPONIBLE', '2B', 'EJECUTIVA', 480),
(155, 25, 'DISPONIBLE', '2C', 'EJECUTIVA', 480),
(156, 26, 'DISPONIBLE', '1A', 'ECONOMICA', 290),
(157, 26, 'DISPONIBLE', '1B', 'ECONOMICA', 290),
(158, 26, 'DISPONIBLE', '1C', 'ECONOMICA', 290),
(159, 26, 'DISPONIBLE', '2A', 'EJECUTIVA', 490),
(160, 26, 'DISPONIBLE', '2B', 'EJECUTIVA', 490),
(161, 27, 'DISPONIBLE', '1A', 'ECONOMICA', 300),
(162, 27, 'DISPONIBLE', '1B', 'ECONOMICA', 300),
(163, 28, 'DISPONIBLE', '1A', 'ECONOMICA', 310),
(164, 28, 'DISPONIBLE', '1B', 'ECONOMICA', 310),
(165, 29, 'DISPONIBLE', '1A', 'ECONOMICA', 320),
(166, 29, 'DISPONIBLE', '1B', 'ECONOMICA', 320),
(167, 30, 'DISPONIBLE', '1A', 'ECONOMICA', 330),
(168, 30, 'DISPONIBLE', '1B', 'ECONOMICA', 330),
(169, 31, 'DISPONIBLE', '1A', 'ECONOMICA', 340),
(170, 31, 'DISPONIBLE', '1B', 'ECONOMICA', 340),
(171, 32, 'DISPONIBLE', '1A', 'ECONOMICA', 350),
(172, 32, 'DISPONIBLE', '1B', 'ECONOMICA', 350),
(173, 33, 'DISPONIBLE', '1A', 'ECONOMICA', 360),
(174, 33, 'DISPONIBLE', '1B', 'ECONOMICA', 360),
(175, 34, 'DISPONIBLE', '1A', 'ECONOMICA', 370),
(176, 34, 'DISPONIBLE', '1B', 'ECONOMICA', 370);
-- Insertar muchas más reservas
INSERT INTO reservas (id, codigo_reserva, estado, usuarios_id) VALUES
(1, 'RES-001-2025', 'CONFIRMADA', 1),
(2, 'RES-002-2025', 'CONFIRMADA', 2),
(3, 'RES-003-2025', 'PENDIENTE', 3),
(4, 'RES-004-2025', 'CONFIRMADA', 4),
(5, 'RES-005-2025', 'CANCELADA', 5),
(6, 'RES-006-2025', 'CONFIRMADA', 6),
(7, 'RES-007-2025', 'CONFIRMADA', 7),
(8, 'RES-008-2025', 'PENDIENTE', 8),
(9, 'RES-009-2025', 'CONFIRMADA', 9),
(10, 'RES-010-2025', 'CONFIRMADA', 10),
(11, 'RES-011-2025', 'CONFIRMADA', 11),
(12, 'RES-012-2025', 'CONFIRMADA', 12),
(13, 'RES-013-2025', 'PENDIENTE', 13),
(14, 'RES-014-2025', 'CONFIRMADA', 14),
(15, 'RES-015-2025', 'CANCELADA', 1),
(16, 'RES-016-2025', 'CONFIRMADA', 2),
(17, 'RES-017-2025', 'CONFIRMADA', 3),
(18, 'RES-018-2025', 'PENDIENTE', 4),
(19, 'RES-019-2025', 'CONFIRMADA', 5),
(20, 'RES-020-2025', 'CONFIRMADA', 6);

-- Insertar muchas asignaciones de asientos
INSERT INTO asignacion_asiento (pasajeros_id, asientos_id, reservas_id) VALUES
(1, 10, 1), (2, 11, 1),   -- Usuario 1 reserva 2 asientos
(3, 16, 2),               -- Usuario 2 reserva 1 asiento ejecutivo
(4, 61, 3), (5, 62, 3),   -- Usuario 3 reserva 2 asientos
(6, 67, 4),               -- Usuario 4 reserva 1 asiento
(7, 70, 5),               -- Usuario 5 (cancelada)
(8, 73, 6), (9, 74, 6),   -- Usuario 6 reserva 2 asientos
(10, 76, 7),              -- Usuario 7 reserva 1 asiento
(11, 79, 8), (12, 80, 8), -- Usuario 8 reserva 2 asientos
(13, 82, 9),              -- Usuario 9 reserva 1 asiento
(1, 100, 10),             -- Usuario 10 reserva 1 asiento
(2, 103, 11),             -- Usuario 11 reserva 1 asiento
(3, 106, 12), (4, 107, 12), -- Usuario 12 reserva 2 asientos
(5, 112, 13),             -- Usuario 13 reserva 1 asiento
(6, 118, 14), (7, 119, 14), -- Usuario 14 reserva 2 asientos nacionales
(8, 124, 15),             -- Usuario 1 segunda reserva (cancelada)
(9, 127, 16),             -- Usuario 2 segunda reserva
(10, 130, 17), (11, 131, 17), -- Usuario 3 reserva internacional
(12, 136, 18),            -- Usuario 4 reserva internacional
(13, 139, 19),            -- Usuario 5 reserva internacional
(1, 64, 20);              -- Usuario 6 segunda reserva

-- Insertar muchos más pagos
INSERT INTO pagos (id, reservas_id, total, metodo_pago, fecha, hora) VALUES
(1, 1, 500, 'TARJETA_CREDITO', DATE_SUB(CURDATE(), INTERVAL 5 DAY), '10:30:00'),
(2, 2, 480, 'TARJETA_DEBITO', DATE_SUB(CURDATE(), INTERVAL 4 DAY), '14:15:00'),
(3, 3, 600, 'PAYPAL', DATE_SUB(CURDATE(), INTERVAL 3 DAY), '09:45:00'),
(4, 4, 350, 'TARJETA_CREDITO', DATE_SUB(CURDATE(), INTERVAL 2 DAY), '16:20:00'),
(5, 5, 380, 'TRANSFERENCIA', DATE_SUB(CURDATE(), INTERVAL 1 DAY), '11:00:00'),
(6, 6, 840, 'TARJETA_CREDITO', CURDATE(), '08:30:00'),
(7, 7, 420, 'TARJETA_DEBITO', CURDATE(), '12:45:00'),
(8, 8, 560, 'PAYPAL', CURDATE(), '15:20:00'),
(9, 9, 290, 'TARJETA_CREDITO', CURDATE(), '17:10:00'),
(10, 10, 220, 'TRANSFERENCIA', CURDATE(), '19:30:00'),
(11, 11, 230, 'TARJETA_CREDITO', DATE_ADD(CURDATE(), INTERVAL 1 DAY), '10:00:00'),
(12, 12, 1100, 'TARJETA_DEBITO', DATE_ADD(CURDATE(), INTERVAL 1 DAY), '14:20:00'),
(13, 13, 320, 'PAYPAL', DATE_ADD(CURDATE(), INTERVAL 1 DAY), '16:45:00'),
(14, 14, 300, 'TARJETA_CREDITO', DATE_ADD(CURDATE(), INTERVAL 1 DAY), '18:30:00'),
(15, 16, 180, 'TRANSFERENCIA', DATE_ADD(CURDATE(), INTERVAL 2 DAY), '09:15:00'),
(16, 17, 1700, 'TARJETA_CREDITO', DATE_ADD(CURDATE(), INTERVAL 2 DAY), '11:40:00'),
(17, 19, 880, 'TARJETA_DEBITO', DATE_ADD(CURDATE(), INTERVAL 2 DAY), '13:25:00'),
(18, 20, 320, 'PAYPAL', DATE_ADD(CURDATE(), INTERVAL 2 DAY), '15:50:00');

-- Insertar más tickets
INSERT INTO tickets (id, asientos_id, pagos_id) VALUES
(1, 10, 1), (2, 11, 1),
(3, 16, 2),
(4, 61, 3), (5, 62, 3),
(6, 67, 4),
(7, 73, 6), (8, 74, 6),
(9, 76, 7),
(10, 79, 8), (11, 80, 8),
(12, 82, 9),
(13, 100, 10),
(14, 103, 11),
(15, 106, 12), (16, 107, 12),
(17, 112, 13),
(18, 118, 14);