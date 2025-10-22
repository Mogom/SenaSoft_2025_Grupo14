// Opciones de cors, ip autorizada, metodos autorizados y headers autorizados
const corsOption = {
    origin: ['http://127.0.0.1:3001/'],
    methods : ['GET', 'POST', 'PUT'],
    allowedHeaders : ['Content-type']
}

module.exports = {corsOption}