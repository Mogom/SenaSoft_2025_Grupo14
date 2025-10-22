-- Active: 1761166194037@@127.0.0.1@3306@GESTION_VUELOS
DROP DATABASE GESTION_VUELOS;
CREATE DATABASE IF NOT EXISTS GESTION_VUELOS;

USE GESTION_VUELOS;

CREATE TABLE personas (
  id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  primer_apellido varchar(75) NOT NULL,
  segundo_apellido varchar(75) NOT NULL,
  nombres varchar(100) NOT NULL,
  fecha_nacimiento date NOT NULL,
  genero varchar(45) NOT NULL,
  tipo_documento varchar(45) NOT NULL,
  numero_documento varchar(75) NOT NULL,
  telefono varchar(75) NOT NULL,
  correo varchar(75) NOT NULL,
  rol varchar(45) NOT NULL
);

CREATE TABLE aviones (
  id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  matricula varchar(45) NOT NULL,
  tipo_avion varchar(45) NOT NULL,
  marca varchar(100) NOT NULL,
  modelo varchar(45) NOT NULL,
  capacidad int(11) NOT NULL
); 

CREATE TABLE capitanes (
  id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  numero_licencia varchar(100) NOT NULL,
  horas_vuelo int(11) NOT NULL,
  personas_id int(11) NOT NULL,
  FOREIGN KEY (personas_id) REFERENCES personas (id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE vuelos (
  id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  numero_vuelo int(11) NOT NULL,
  fecha_salida date NOT NULL,
  hora_salida time NOT NULL,
  ciudad_origen varchar(45) NOT NULL,
  ciudad_destino varchar(45) NOT NULL,
  aviones_id int(11) NOT NULL,
  capitanes_id int(11) NOT NULL,
  hora_llegada time NOT NULL,
  fecha_llegada date NOT NULL,
  FOREIGN KEY (aviones_id) REFERENCES aviones (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (capitanes_id) REFERENCES capitanes (id) ON DELETE NO ACTION ON UPDATE NO ACTION
); 

CREATE TABLE asientos (
  id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  vuelos_id int(11) NOT NULL,
  disponibilidad varchar(100) NOT NULL,
  codigo_asiento varchar(100) NOT NULL,
  clase varchar(100) NOT NULL,
  valor decimal(10,0) NOT NULL,
  FOREIGN KEY (vuelos_id) REFERENCES vuelos (id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE usuarios (
  id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  personas_id int(11) NOT NULL,
  contraseña VARCHAR (100) NOT NULL,
  FOREIGN KEY (personas_id) REFERENCES personas (id) ON DELETE NO ACTION ON UPDATE NO ACTION
); 

CREATE TABLE pasajeros (
  id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  condicion_infante varchar(45) NOT NULL,
  personas_id int(11) NOT NULL,
  FOREIGN KEY (personas_id) REFERENCES personas (id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE reservas (
  id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  codigo_reserva varchar(100) NOT NULL,
  estado varchar(100) NOT NULL,
  usuarios_id int(11) NOT NULL,
  FOREIGN KEY (usuarios_id) REFERENCES usuarios (id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE pagos (
  id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  reservas_id int(11) NOT NULL,
  total decimal(10,0) NOT NULL,
  metodo_pago varchar(100) NOT NULL,
  fecha date NOT NULL,
  hora time NOT NULL,
  FOREIGN KEY (reservas_id) REFERENCES reservas (id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE asignacion_asiento (
  pasajeros_id int(11) NOT NULL,
  asientos_id int(11) NOT NULL,
  reservas_id int(11) NOT NULL,
  FOREIGN KEY (pasajeros_id) REFERENCES pasajeros (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (asientos_id) REFERENCES asientos (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (reservas_id) REFERENCES reservas (id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE tickets (
  id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  asientos_id int(11) NOT NULL,
  pagos_id int(11) NOT NULL,
  FOREIGN KEY (asientos_id) REFERENCES asientos (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (pagos_id) REFERENCES pagos (id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

