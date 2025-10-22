const Base = require('./Base.service')

class FlightService extends Base {
    constructor(...args) {
        super(...args)
    }


    async getAllFlights() {
        const { db, query } = this.assistDB();
        try {
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
}

module.exports = FlightService