import conx from "../db/conx.js";




/* 
 * Esta consulta me retorn la lista de todas las ventas con la información de los clientes y la forma de pago
 * http://127.1.1.1:5001/usuario/all
 * * method: GET
 */
const usuarioAll = async (req, res) => {
    try {
        const db = await conx();
        const usuario = db.collection("usuario");
        let result = await usuario.find().toArray();
        res.status(200).send(result)
    } catch (error) {
        console.log("error en la consulta en cuestion", error);
        res.status(400).send(error)
    }
}


/* 
 * Esta consulta me retorna los usuario que se realizaron en el mes de julio de 2023
 * http://127.1.1.1:5001/usuario/julio
 * * method: GET
 */
const usuarioJulio = async(req, res) => {
    try {

         const db = await conx();
         const usuario = db.collection("usuario");
         let result = await usuario.find({
            "$and": [{
            "Fecha ":{ "$gt" :  new Date('2023-07-01')}
          },{ " Fecha ":{ "$lt" :  new Date('2023-07-28')}
            }]
         }).toArray();

         console.log(result);
         res.status(200).send(result)

    } catch (error) {
        console.log("error en la consulta en cuestion");
        res.status(400).send(error)
    }
}

/* 
 * me permite insertar usuario 
 * http://127.1.1.1:5001/usuario/insert
 * * method: POST
 * Data a enviar
{
    "Fecha":"2023-11-11",
    "IdEmpleadoFk":1,
    "IdClienteFk":1,
    "IdFormaPagoFK":1
}
 * 
*/
const usuarioinsert = (req, res) => {
    try {
        let data = req.body;

    } catch (error) {
        console.log("error en la consulta en cuestion");
        res.status(400).send(error)
    }
}

/* 
 * me permite actulizar una usuario 
 * http://127.1.1.1:5001/usuario/update
 * method: PUT
 *  * Data a enviar
{
    "Id":2,
    "Fecha":"2023-11-11",
    "IdEmpleadoFk":1,
    "IdClienteFk":1,
    "IdFormaPagoFK":1
}
*/
const usuarioupdate = (req, res) => {
    try {

        let data = req.body;

    } catch (error) {
        console.log("error en la consulta en cuestion");
        res.status(400).send(error)
    }
}

/* 
 * me permite eliminar usuario 
 * http://127.1.1.1:5001/usuario/delete
 * method: DELETE
 * Data a enviar
{
    "Id": 5
}
*/
const usuariodelete = (req, res) => {
    try {
        let Id = req.body.Id;
        

    } catch (error) {
        console.log("error en la consulta en cuestion");
        res.status(400).send(error)
    }
}

export {
    usuarioAll,
    usuarioJulio,
    usuarioinsert,
    usuarioupdate,
    usuariodelete
}
