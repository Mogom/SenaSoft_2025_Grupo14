// Api key alojada en las variables de entorno
const secret = process.env.API_KEY

// Funcion que validara si la peticion contiene el header llamado "x-api-key"
function validatorApiKey (req,res,next){
    const apiKey = req.headers['x-api-key']

    if (!apiKey || apiKey !== secret){
        console.log("No autorizado")
        return res.status(498).json({message:'Usuario no autorizado'})
    }
    // Funcion que llevara al mensaje de catch(err)
    next()
}


module.exports = {validatorApiKey}