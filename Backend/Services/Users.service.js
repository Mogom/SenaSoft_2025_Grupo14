const Base = require('./Base.service')

class UsersService extends Base {
    constructor(...args) {
        super(...args)
    }


    async getAllUsers() {
        const { db, query } = this.assistDB();
        try {
            const result = await query("CALL GetAllUsers()");
            const data = this.validateResult(result);
            return {
                message: 'Users retrieved succesfully',
                result: data
            }
        } catch (err) {
            this.handleError(err);
        } finally {
            db.closeConnection();
        }
    }

    async getUserBy(id) {
        const by = id.replace(":","").replace(" ","")
        const { db, query } = this.assistDB();
        try {
            const result = await query("CALL GetUserBy(?)",[by]);
            const data = this.validateResult(result);
            return {
                message: 'Users retrieved succesfully',
                result: data
            }
        } catch (err) {
            this.handleError(err);
        } finally {
            db.closeConnection();
        }
    }
}

module.exports = UsersService