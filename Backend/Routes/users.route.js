const express = require('express')
const router = express.Router()

const UsersService = require('../Services/Users.service');
const users = new UsersService()

router.get("/", async(req,res) => {
    try {
        const data = users.getAllUsers();
        res.json(data)
        console.log('usuarios consumidos correctamente')
    } catch (err){
        res.status(err.status || 500).json({ error: err.message});
    }
})

module.exports = router
