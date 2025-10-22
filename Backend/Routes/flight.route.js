const express = require('express')
const router = express.Router()

const FlightService = require('../Services/Flight.service');
const flight = new FlightService()

router.get("/", async(req,res) => {
    try {
        const data = await flight.getAllFlights();
        res.json(data)
        console.log('Vuelos consumidos correctamente')
    } catch (err){
        res.status(err.status || 500).json({ error: err.message});
    }
})

router.get("/get:by", async(req,res) => {
    const by = req.params.by
    try {
        const data = await flight.getFlightById(by);
        res.json(data)
        console.log('Vuelos consumidos correctamente')
    } catch (err){
        res.status(err.status || 500).json({ error: err.message});
    }
})

router.get("/date:by", async(req,res) => {
    const by = req.params.by
    try {
        const data = await flight.getFlightByDate(by);
        res.json(data)
        console.log('Vuelos consumidos correctamente')
    } catch (err){
        res.status(err.status || 500).json({ error: err.message});
    }
})

router.get("/free/chairs:by", async(req,res) => {
    const by = req.params.by
    try {
        const data = await flight.getFreeChairs(by);
        res.json(data)
        console.log('Vuelos consumidos correctamente')
    } catch (err){
        res.status(err.status || 500).json({ error: err.message});
    }
})

router.post("/search/form", async(req,res) => {
    const body = req.body
    try {
        const data = await flight.getFlightByForm(body);
        res.json(data)
        console.log('Vuelos consumidos correctamente')
    } catch (err){
        res.status(err.status || 500).json({ error: err.message});
    }
})

module.exports = router
