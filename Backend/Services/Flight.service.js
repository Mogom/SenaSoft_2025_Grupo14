const Base = require('./Base.service')

class FlightService extends Base {
    constructor(...args) {
        super(...args)
    }

    async getAllFlights() {
        const { db, query } = this.assistDB();
        try {
            // Uso de la funcion query de la clase Base
            const result = await query("CALL GetAllFlights()");
            const data = this.validateResult(result);
            return {
                message: 'Flights retrieved succesfully',
                result: data
            }
        } catch (err) {
            this.handleError(err);
        } finally {
            db.closeConnection();
        }
    }

    async getFlightById(id) {
        const by = id.replace(":","").replace(" ","")
        const { db, query } = this.assistDB();
        try {
            // Uso de la funcion query de la clase Base
            const result = await query("CALL GetFlightById(?)",[by]);
            const data = this.validateResult(result);
            return {
                message: 'Flights retrieved succesfully',
                result: data
            }
        } catch (err) {
            this.handleError(err);
        } finally {
            db.closeConnection();
        }
    }

    async getFlightByDate(date) {
        const by = date.replace(":","").replace(" ","")
        const { db, query } = this.assistDB();
        try {
            // Uso de la funcion query de la clase Base
            const result = await query("CALL GetFlightByDate(?)",[by]);
            const data = this.validateResult(result);
            return {
                message: 'Flights retrieved succesfully',
                result: data
            }
        } catch (err) {
            this.handleError(err);
        } finally {
            db.closeConnection();
        }
    }

    async getFreeChairs(id) {
        const by = id.replace(":","").replace(" ","")
        const { db, query } = this.assistDB();
        try {
            // Uso de la funcion query de la clase Base
            const result = await query("CALL GetFreeChairs(?)",[by]);
            const data = this.validateResult(result);
            return {
                message: 'Flights retrieved succesfully',
                result: data
            }
        } catch (err) {
            this.handleError(err);
        } finally {
            db.closeConnection();
        }
    }

    async getFlightByForm(data) {
        const by = [
            data.ciudad_origen,
            data.ciudad_destino,
            data.fecha_salida,
            data.cantidad_sillas,
        ];
        const { db, query } = this.assistDB();
        try {
            // Uso de la funcion query de la clase Base
            const result = await query("CALL GetFlightByForm(?)",[by]);
            const data = this.validateResult(result);
            return {
                message: 'Flights retrieved succesfully',
                result: data
            }
        } catch (err) {
            this.handleError(err);
        } finally {
            db.closeConnection();
        }
    }

    async getFlightsByUser(data) {
        const by = data.replace(":","").replace(" ","")
        const { db, query } = this.assistDB();
        try {
            // Uso de la funcion query de la clase Base
            const result = await query("CALL SearchFlightsByUser(?)",[by]);
            const data = this.validateResult(result);
            return {
                message: 'Flights retrieved succesfully',
                result: data
            }
        } catch (err) {
            this.handleError(err);
        } finally {
            db.closeConnection();
        }
    }

    async addReserve (data){
        const newReserve = [
            data.codigo_reserva,
            data.estado,
            data.usuarios_id,
        ];
        const {db, query} = this.assistDB();
        try {
            const result = await query("CALL RegistReserve(?,?,?)",newReserve);
            const data = this.validateResult(result);
            return {
                message:"User created successfully",
                result: data
            };
        } catch (err) {
            this.handleError(err);
        } finally {
            db.closeConnection();
        }   
    }
}

module.exports = FlightService