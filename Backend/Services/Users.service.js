const Base = require('./Base.service')

class UsersService extends Base {
    constructor(...args){
        super(...args)
    }
    
    async getAllUsers () {
        const {db, query} = this.assistDB()
        try {
            const result = await query('SELECT * FROM USUARIOS')
            const data = this.validateResult(result);
            return {
                message: 'Users retrieved succesfully',
                status: data
            }
        } catch (err) {
            this.handleError(err)
        } finally {
            db.closeConnection()
        }
    }
}

module.exports = UsersService