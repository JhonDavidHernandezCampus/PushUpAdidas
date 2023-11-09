import conx from "../db/conx.js";


/* 
 * Esta consulta me retorn las ventas que se realizaron en el mes de julio de 2023
 * http://127.1.1.1:5001/ventas/julio
 */
const ventasJulio = (req,res) =>{
    try {
        let query = `SELECT * FROM venta WHERE Fecha > '2023-07-01' and Fecha < '2023-07-28';`;
        conx.query(query, (err, respuesta, fill)=>{
            if (err) {
                throw {message:err, status:400}
            }else{
                res.send(respuesta)
            }
        });
    } catch (error) {
        console.log("error en la consunta en cuestion");
        res.status(400).send(error)
    }
}

export {
    ventasJulio,
}