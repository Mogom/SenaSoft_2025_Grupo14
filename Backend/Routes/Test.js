// Estructura de datos desde el frontend
const reservaData = {
    usuario_id: 1,
    total: 1200.00,
    metodo_pago: "tarjeta_credito",
    pasajeros: [
        {
            primer_apellido: "Gomez",
            segundo_apellido: "Perez",
            nombres: "Carlos Alberto",
            fecha_nacimiento: "1985-03-15",
            genero: "masculino",
            tipo_documento: "DNI",
            numero_documento: "12345678",
            telefono: "3001234567",
            correo: "carlos@email.com",
            condicion_infante: "no"
        },
        {
            primer_apellido: "Gomez",
            segundo_apellido: "Perez", 
            nombres: "Ana Maria",
            fecha_nacimiento: "1988-07-22",
            genero: "femenino",
            tipo_documento: "DNI",
            numero_documento: "87654321",
            telefono: "3007654321",
            correo: "ana@email.com",
            condicion_infante: "no"
        }
    ],
    asientos: [15, 16]
};

// Enviar al backend
fetch('/api/reservas', {
    method: 'POST',
    headers: {
        'Content-Type': 'application/json',
    },
    body: JSON.stringify(reservaData)
})