const rateLimit = require('express-rate-limit')

const limiter = rateLimit({
    windowMs: 5 * 60 * 1000,        // 5 minutes
    max: 500,                       // Limit each IP to 500 requests per windowMs
    message: 'Demasiadas peticiones desde esta IP, por favor intenta de nuevo más tarde'
})

module.exports = {limiter}