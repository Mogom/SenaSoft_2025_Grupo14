const Database = require('./Database')
const util = require('util')

class Base {
    constructor(...args){
        this.args = args
    }

    // Funcion global que permite verificar resultados de una query
    validateResult (result) {
        if (!result || !result[0]){
            throw {message: 'No data found', status: 404}
        }
        return result[0];
    }

    // Funcion global que permite verificar y retornar errores despues de un 
    // catch (err)
    handleError (err, statusCode = 500) {
        throw {
            message: err.message || err,
            status: err.status || statusCode
        }
    }

    // Funcion global que retorna la conexion a la base de datos y una query preparada
    assistDB () {
        // Instanciado a la base de datos
        const db = new Database()
        db.connect()
        // Funcion de query, utiliza la libreria "util" para crear querys de forma asincrona
        // reduciendo las lineas de codigo y permitiendo re usabilidad
        const query = util.promisify(db.connection.query).bind(db.connection)
        return {db , query}
    }
}

module.exports = Base