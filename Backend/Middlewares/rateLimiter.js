const rateLimit = require('express-rate-limit')

const limiter = rateLimit({
    windowMs: 5 * 60 * 1000,        // 5 minutos
    max: 10,                       // Limitar cada IP a 500 requests cada 5 minutos
    message: 'Demasiadas peticiones desde esta IP, por favor intenta de nuevo más tarde'
})

module.exports = {limiter}