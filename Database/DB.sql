-- Active: 1759201386306@@127.0.0.1@3306@Test

CREATE TABLE asientos (
  id int(11) NOT NULL,
  vuelos_id int(11) NOT NULL,
  disponibilidad varchar(100) NOT NULL,
  codigo_asiento varchar(100) NOT NULL,
  clase varchar(100) NOT NULL,
  valor decimal(10,0) NOT NULL
);

CREATE TABLE asignacion_asiento (
  pasajeros_id int(11) NOT NULL,
  asientos_id int(11) NOT NULL,
  reservas_id int(11) NOT NULL
);

CREATE TABLE aviones (
  id int(11) NOT NULL,
  matricula varchar(45) NOT NULL,
  tipo_avion varchar(45) NOT NULL,
  marca varchar(100) NOT NULL,
  modelo varchar(45) NOT NULL,
  capacidad int(11) NOT NULL
); 

CREATE TABLE capitanes (
  id int(11) NOT NULL,
  numero_licencia varchar(100) NOT NULL,
  horas_vuelo int(11) NOT NULL,
  personas_id int(11) NOT NULL
);

CREATE TABLE pagos (
  id int(11) NOT NULL,
  reservas_id int(11) NOT NULL,
  total decimal(10,0) NOT NULL,
  metodo_pago varchar(100) NOT NULL,
  fecha date NOT NULL,
  hora time NOT NULL
);

CREATE TABLE pasajeros (
  id int(11) NOT NULL,
  condicion_infante varchar(45) NOT NULL,
  personas_id int(11) NOT NULL
);

CREATE TABLE personas (
  id int(11) NOT NULL,
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

CREATE TABLE reservas (
  id int(11) NOT NULL,
  codigo_reserva varchar(100) NOT NULL,
  estado varchar(100) NOT NULL,
  usuarios_id int(11) NOT NULL
);

CREATE TABLE tickets (
  id int(11) NOT NULL,
  asientos_id int(11) NOT NULL,
  pagos_id int(11) NOT NULL
);

CREATE TABLE usuarios (
  id int(11) NOT NULL,
  personas_id int(11) NOT NULL
); 

CREATE TABLE vuelos (
  id int(11) NOT NULL,
  numero_vuelo int(11) NOT NULL,
  fecha_salida date NOT NULL,
  hora_salida time NOT NULL,
  ciudad_origen varchar(45) NOT NULL,
  ciudad_destino varchar(45) NOT NULL,
  aviones_id int(11) NOT NULL,
  capitanes_id int(11) NOT NULL,
  hora_llegada time NOT NULL,
  fecha_llegada date NOT NULL
); 

ALTER TABLE asientos
  ADD PRIMARY KEY (id),
  ADD KEY fk_asientos_vuelos1_idx (vuelos_id);
ALTER TABLE asignacion_asiento
  ADD KEY fk_asignacion_asiento_pasajeros1_idx (pasajeros_id),
  ADD KEY fk_asignacion_asiento_asientos1_idx (asientos_id),
  ADD KEY fk_asignacion_asiento_reservas1_idx (reservas_id);
ALTER TABLE aviones
  ADD PRIMARY KEY (id);
ALTER TABLE capitanes
  ADD PRIMARY KEY (id),
  ADD KEY fk_capitanes_personas1_idx (personas_id);
ALTER TABLE pagos
  ADD PRIMARY KEY (id),
  ADD KEY fk_recibos_reservas1_idx (reservas_id);
ALTER TABLE pasajeros
  ADD PRIMARY KEY (id),
  ADD KEY fk_pasajeros_personas1_idx (personas_id);
ALTER TABLE personas
  ADD PRIMARY KEY (id);
ALTER TABLE reservas
  ADD PRIMARY KEY (id),
  ADD KEY fk_reservas_usuarios1_idx (usuarios_id);
ALTER TABLE tickets
  ADD PRIMARY KEY (id),
  ADD KEY fk_tickets_asientos1_idx (asientos_id),
  ADD KEY fk_tickets_pagos1_idx (pagos_id);
ALTER TABLE usuarios
  ADD PRIMARY KEY (id),
  ADD KEY fk_usuarios_personas1_idx (personas_id);
ALTER TABLE vuelos
  ADD PRIMARY KEY (id),
  ADD KEY fk_vuelos_aviones1_idx (aviones_id),
  ADD KEY fk_vuelos_capitanes1_idx (capitanes_id);
ALTER TABLE asientos
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE aviones
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE capitanes
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE pagos
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE pasajeros
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE personas
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE reservas
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE tickets
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE usuarios
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE asientos
  ADD CONSTRAINT fk_asientos_vuelos1 FOREIGN KEY (vuelos_id) REFERENCES vuelos (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE asignacion_asiento
  ADD CONSTRAINT fk_asignacion_asiento_asientos1 FOREIGN KEY (asientos_id) REFERENCES asientos (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_asignacion_asiento_pasajeros1 FOREIGN KEY (pasajeros_id) REFERENCES pasajeros (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_asignacion_asiento_reservas1 FOREIGN KEY (reservas_id) REFERENCES reservas (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE capitanes
  ADD CONSTRAINT fk_capitanes_personas1 FOREIGN KEY (personas_id) REFERENCES personas (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE pagos
  ADD CONSTRAINT fk_recibos_reservas1 FOREIGN KEY (reservas_id) REFERENCES reservas (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE pasajeros
  ADD CONSTRAINT fk_pasajeros_personas1 FOREIGN KEY (personas_id) REFERENCES personas (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE reservas
  ADD CONSTRAINT fk_reservas_usuarios1 FOREIGN KEY (usuarios_id) REFERENCES usuarios (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE tickets
  ADD CONSTRAINT fk_tickets_asientos1 FOREIGN KEY (asientos_id) REFERENCES asientos (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_tickets_pagos1 FOREIGN KEY (pagos_id) REFERENCES pagos (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE usuarios
  ADD CONSTRAINT fk_usuarios_personas1 FOREIGN KEY (personas_id) REFERENCES personas (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE vuelos
  ADD CONSTRAINT fk_vuelos_aviones1 FOREIGN KEY (aviones_id) REFERENCES aviones (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_vuelos_capitanes1 FOREIGN KEY (capitanes_id) REFERENCES capitanes (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;


WITH fk_info as (
(SELECT (@fk_info:=NULL),
    (SELECT (0)
    FROM (SELECT kcu.table_schema,
        kcu.table_name,
        kcu.column_name as fk_column,
        kcu.constraint_name as foreign_key_name,
        kcu.referenced_table_schema as reference_schema,
        kcu.referenced_table_name as reference_table,
        kcu.referenced_column_name as reference_column,
        CONCAT('FOREIGN KEY (', kcu.column_name, ') REFERENCES ',
            kcu.referenced_table_name, '(', kcu.referenced_column_name, ') ',
            'ON UPDATE ', rc.update_rule,
            ' ON DELETE ', rc.delete_rule) AS fk_def
    FROM
        information_schema.key_column_usage kcu
    JOIN
        information_schema.referential_constraints rc
        ON kcu.constraint_name = rc.constraint_name
            AND kcu.table_schema = rc.constraint_schema
        AND kcu.table_name = rc.table_name
    WHERE
        kcu.referenced_table_name IS NOT NULL) as fk
    WHERE table_schema LIKE IFNULL(NULL, '%')
        AND table_schema = DATABASE()
        AND (0x00) IN (@fk_info:=CONCAT_WS(',', @fk_info, CONCAT('{"schema":"',table_schema,
                                    '","table":"',table_name,
                                    '","column":"', IFNULL(fk_column, ''),
                                                '","foreign_key_name":"', IFNULL(foreign_key_name, ''),
                                                '","reference_schema":"', IFNULL(reference_schema, ''),
                                                '","reference_table":"', IFNULL(reference_table, ''),
                                                '","reference_column":"', IFNULL(reference_column, ''),
                                                '","fk_def":"', IFNULL(fk_def, ''),
                                    '"}')))))
), pk_info AS (
    (SELECT (@pk_info:=NULL),
              (SELECT (0)
               FROM (SELECT TABLE_SCHEMA,
                            TABLE_NAME AS pk_table,
                            COLUMN_NAME AS pk_column,
                            (SELECT CONCAT('PRIMARY KEY (', GROUP_CONCAT(inc.COLUMN_NAME ORDER BY inc.ORDINAL_POSITION SEPARATOR ', '), ')')
                               FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE as inc
                               WHERE inc.CONSTRAINT_NAME = 'PRIMARY' and
                                     outc.TABLE_SCHEMA = inc.TABLE_SCHEMA and
                             		 outc.TABLE_NAME = inc.TABLE_NAME) AS pk_def
                       FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE as outc
                       WHERE CONSTRAINT_NAME = 'PRIMARY'
                       GROUP BY TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME
                       ORDER BY TABLE_SCHEMA, TABLE_NAME, MIN(ORDINAL_POSITION)) AS pk
               WHERE table_schema LIKE IFNULL(NULL, '%')
               AND table_schema = DATABASE()
               AND (0x00) IN (@pk_info:=CONCAT_WS(',', @pk_info, CONCAT('{"schema":"', table_schema,
                                                                        '","table":"', pk_table,
                                                                        '","column":"', pk_column,
                                                                        '","pk_def":"', IFNULL(pk_def, ''),
                                                                        '"}')))))
), cols as
(
  (SELECT (@cols := NULL),
        (SELECT (0)
         FROM information_schema.columns cols
         WHERE cols.table_schema LIKE IFNULL(NULL, '%')
           AND cols.table_schema = DATABASE()
           AND (0x00) IN (@cols := CONCAT_WS(',', @cols, CONCAT(
                '{"schema":"', cols.table_schema,
                '","table":"', cols.table_name,
                '","name":"', REPLACE(cols.column_name, '"', '\"'),
                '","type":"', LOWER(cols.data_type),
                '","character_maximum_length":"', IFNULL(cols.character_maximum_length, 'null'),
                '","precision":',
                    CASE
                        WHEN cols.data_type IN ('decimal', 'numeric')
                        THEN CONCAT('{"precision":', IFNULL(cols.numeric_precision, 'null'),
                                    ',"scale":', IFNULL(cols.numeric_scale, 'null'), '}')
                        ELSE 'null'
                    END,
                ',"ordinal_position":', cols.ordinal_position,
                ',"nullable":', IF(cols.is_nullable = 'YES', 'true', 'false'),
                ',"default":"', "",
                '","collation":"', IFNULL(cols.collation_name, ''),
                '","is_identity":', IF(cols.extra LIKE '%auto_increment%', 'true', 'false'),
                '}'
            )))))
), indexes as (
  (SELECT (@indexes:=NULL),
                (SELECT (0)
                 FROM information_schema.statistics indexes
                 WHERE table_schema LIKE IFNULL(NULL, '%')
                     AND table_schema = DATABASE()
                     AND (0x00) IN  (@indexes:=CONCAT_WS(',', @indexes, CONCAT('{"schema":"',indexes.table_schema,
                                         '","table":"',indexes.table_name,
                                         '","name":"', indexes.index_name,
                                         '","size":',
                                                                      (SELECT IFNULL(SUM(stat_value * @@innodb_page_size), -1) AS size_in_bytes
                                                                       FROM mysql.innodb_index_stats
                                                                       WHERE stat_name = 'size'
                                                                           AND index_name != 'PRIMARY'
                                                                           AND index_name = indexes.index_name
                                                                           AND TABLE_NAME = indexes.table_name
                                                                           AND database_name = indexes.table_schema),
                                                                  ',"column":"', indexes.column_name,
                                                      '","index_type":"', LOWER(indexes.index_type),
                                                      '","cardinality":', indexes.cardinality,
                                                      ',"direction":"', (CASE WHEN indexes.collation = 'D' THEN 'desc' ELSE 'asc' END),
                                                      '","column_position":', indexes.seq_in_index,
                                                      ',"unique":', IF(indexes.non_unique = 1, 'false', 'true'), '}')))))
), tbls as
(
  (SELECT (@tbls:=NULL),
              (SELECT (0)
               FROM information_schema.tables tbls
               WHERE table_schema LIKE IFNULL(NULL, '%')
                   AND table_schema = DATABASE()
                   AND (0x00) IN (@tbls:=CONCAT_WS(',', @tbls, CONCAT('{', '"schema":"', `TABLE_SCHEMA`, '",',
                                               '"table":"', `TABLE_NAME`, '",',
                                             '"rows":', IFNULL(`TABLE_ROWS`, 0),
                                             ', "type":"', IFNULL(`TABLE_TYPE`, ''), '",',
                                             '"engine":"', IFNULL(`ENGINE`, ''), '",',
                                             '"collation":"', IFNULL(`TABLE_COLLATION`, ''), '"}')))))
), views as (
(SELECT (@views:=NULL),
              (SELECT (0)
               FROM information_schema.views views
               WHERE table_schema LIKE IFNULL(NULL, '%')
                   AND table_schema = DATABASE()
                   AND (0x00) IN (@views:=CONCAT_WS(',', @views, CONCAT('{', '"schema":"', `TABLE_SCHEMA`, '",',
                                                   '"view_name":"', `TABLE_NAME`, '",',
                                                   '"view_definition":""}'))) ) )
)
(SELECT CAST(CONCAT('{"fk_info": [',IFNULL(@fk_info,''),
                '], "pk_info": [', IFNULL(@pk_info, ''),
            '], "columns": [',IFNULL(@cols,''),
            '], "indexes": [',IFNULL(@indexes,''),
            '], "tables":[',IFNULL(@tbls,''),
            '], "views":[',IFNULL(@views,''),
            '], "database_name": "', DATABASE(),
            '", "version": "', VERSION(), '"}') AS CHAR) AS metadata_json_to_import
 FROM fk_info, pk_info, cols, indexes, tbls, views);
