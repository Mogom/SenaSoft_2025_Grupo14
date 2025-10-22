// Dependencia para usar variables de entorno
require("dotenv").config()

// Inicializacion de entorno express
const express = require('express')
const app = express()

// Dependencia para establecer rutas que pueden consumir la api
const cors = require('cors')
const { corsOption } = require("./Middlewares/corsOption")

const users = require('./Routes/users.route')

app.use(cors(corsOption))
app.use(express.json())


app.use('/users', users)

// Ruta de prueba

app.get("/", async (req,res)=>{
    const data = [{message:"conectado correctamente al backend"}];
    try {
        res.json(data)
        console.log('usuarios consumidos correctamente')
    } catch (err){
        res.status(err.status || 500).json({ error: err.message});
    }
})

// Designacion de puerto
app.listen(process.env.PORT)