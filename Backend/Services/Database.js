// Libreria para crear conexiones y querys a la base de datos
const mysql = require('mysql2')

require('dotenv').config()


class Database {
    constructor(){
        // variable que utilizara los datos dados en la funcion createConnection
        this.connection = this.createConnection()
    }

    // Funcion primaria que define las credenciales de la base de datos
    createConnection  () {
        // Variable que retorna true o false dependiendo si el proyecto
        // corre en un entorno docker o de manera aparte
        const isDocker = process.env.NODE_ENV === 'development'
        return mysql.createConnection({
            host: isDocker ? process.env.DOCKER_HOST : process.env.LOCAL_HOST,
            user: process.env.USER_DB,
            database: process.env.NAME_DB,
            password: process.env.PASSWORD_DB,
            port: process.env.PORT_DB
        })
    }

    // Funcion que utiliza las credenciales dadas anteriormente para conectar la 
    // base de datos
    connect () {
        this.connection.connect((err) => {
            if (err){
                console.log('Error al conectarse a la base de datos',err)
                return
            }
            console.log('Conexion exitosa')
        })
    }

    // Funcion para cerrar la conexion a la base de datos despues de cada query
    closeConnection (){
        this.connection.end((err) =>{
            if (err){
                console.log('Error al desconectar a la base de datos',err)
                return
            }
            console.log('Desconexion exitosa')
        })
    }
}

module.exports = Database