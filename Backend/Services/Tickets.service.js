const Base = require('./Base.service')

class TicketService extends Base {
    constructor(...args) {
        super(...args)
    }

    async getTicketBy(id) {
        const by = id.replace(":","").replace(" ","")
        const { db, query } = this.assistDB();
        try {
            // Uso de la funcion query de la clase Base
            const result = await query("CALL GetTicket(?)",[by]);
            const data = this.validateResult(result);
            return {
                message: 'Tickets retrieved succesfully',
                result: data
            }
        } catch (err) {
            this.handleError(err);
        } finally {
            db.closeConnection();
        }
    }

    async getTicketByUser(id) {
        const by = id.replace(":","").replace(" ","")
        const { db, query } = this.assistDB();
        try {
            // Uso de la funcion query de la clase Base
            const result = await query("CALL GetTicketByUser(?)",[by]);
            const data = this.validateResult(result);
            return {
                message: 'Tickets retrieved succesfully',
                result: data
            }
        } catch (err) {
            this.handleError(err);
        } finally {
            db.closeConnection();
        }
    }

    async getReceiptsByUser(id) {
        const by = id.replace(":","").replace(" ","")
        const { db, query } = this.assistDB();
        try {
            // Uso de la funcion query de la clase Base
            const result = await query("CALL GetReceipts(?)",[by]);
            const data = this.validateResult(result);
            return {
                message: 'Tickets retrieved succesfully',
                result: data
            }
        } catch (err) {
            this.handleError(err);
        } finally {
            db.closeConnection();
        }
    }
}

module.exports = TicketService