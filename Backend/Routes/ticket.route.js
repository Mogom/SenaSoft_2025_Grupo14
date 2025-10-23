const express = require('express')
const router = express.Router()

const TicketService = require('../Services/Tickets.service');
const tickets = new TicketService()


router.get("/get:by", async(req,res) => {
    const by = req.params.by
    try {
        const data = await tickets.getTicketBy(by);
        res.json(data)
        console.log('tickets consumidos correctamente')
    } catch (err){
        res.status(err.status || 500).json({ error: err.message});
    }
})

router.get("/user/get:by", async(req,res) => {
    const by = req.params.by
    try {
        const data = await tickets.getTicketByUser(by);
        res.json(data)
        console.log('tickets consumidos correctamente')
    } catch (err){
        res.status(err.status || 500).json({ error: err.message});
    }
})

router.get("/receipt/get:by", async(req,res) => {
    const by = req.params.by
    try {
        const data = await tickets.getReceiptsByUser(by);
        res.json(data)
        console.log('tickets consumidos correctamente')
    } catch (err){
        res.status(err.status || 500).json({ error: err.message});
    }
})

module.exports = router
