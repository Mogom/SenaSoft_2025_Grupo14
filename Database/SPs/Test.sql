-- Datos de ejemplo para 2 pasajeros
SET @usuario_id = 1;
SET @total = 1200.00;
SET @metodo_pago = 'tarjeta_credito';

-- JSON con datos de los pasajeros
SET @pasajeros_json = '
[
    {
        "primer_apellido": "Gomez",
        "segundo_apellido": "Perez",
        "nombres": "Carlos Alberto",
        "fecha_nacimiento": "1985-03-15",
        "genero": "masculino",
        "tipo_documento": "DNI",
        "numero_documento": "12345678",
        "telefono": "3001234567",
        "correo": "carlos@email.com",
        "condicion_infante": "no"
    },
    {
        "primer_apellido": "Gomez",
        "segundo_apellido": "Perez",
        "nombres": "Ana Maria",
        "fecha_nacimiento": "1988-07-22",
        "genero": "femenino",
        "tipo_documento": "DNI",
        "numero_documento": "87654321",
        "telefono": "3007654321",
        "correo": "ana@email.com",
        "condicion_infante": "no"
    }
]
';

