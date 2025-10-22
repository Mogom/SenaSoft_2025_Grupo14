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

    async addPassenger (data){
        const newPassenger = [
            data.f_backName,
            data.l_backName,
            data.names,
            data.bornDate,
            data.gender,
            data.docType,
            data.doc,
            data.phone,
            data.email,
            data.rol,
            data.childCondition,
        ];
        const {db, query} = this.assistDB();

        try {
            const result = await query("CALL RegisterPassenger(?,?,?,?,?,?,?,?,?,?,?)",newPassenger);
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

module.exports = UsersService