// Opciones de cors, ip autorizada, metodos autorizados y headers autorizados
const corsOption = {
    origin: ['http://127.0.0.1:3001','http://127.0.0.1:5500','http://localhost:8088'],
    methods : ['GET', 'POST', 'PUT'],
    allowedHeaders : ['Content-type', 'x-api-key']
}

module.exports = {corsOption}