const express = require('express')
const router = express.Router()

const UsersService = require('../Services/Users.service');
const users = new UsersService()

router.get("/", async(req,res) => {
    try {
        const data = await users.getAllUsers();
        res.json(data)
        console.log('usuarios consumidos correctamente')
    } catch (err){
        res.status(err.status || 500).json({ error: err.message});
    }
})

router.get("/get:by", async(req,res) => {
    const by = req.params.by
    try {
        const data = await users.getUserBy(by);
        res.json(data)
        console.log('usuarios consumidos correctamente')
    } catch (err){
        res.status(err.status || 500).json({ error: err.message});
    }
})

router.post("/register/passenger", async(req,res) => {
    const body = req.body
    try {
        const data = await users.addPassenger(body);
        res.json(data)
        console.log('usuarios consumidos correctamente')
    } catch (err){
        res.status(err.status || 500).json({ error: err.message});
    }
})


module.exports = router
