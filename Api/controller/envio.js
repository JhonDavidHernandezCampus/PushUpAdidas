import conx from "../db/conx.js";


/* 
 * Esta consulta me retorn todos los envios con sus respectivos cargos y municipios
 * http://127.1.1.1:5001/envio/cargos
 * * method: GET
 */
const envioAll = (req, res) => {
    try {
    } catch (error) {
        console.log("error en la consunta en cuestion");
        res.status(400).send(error)
    }
}

/* 
 * Esta consulta me retorn todos los envios con sus respectivos cargos y municipios
 * http://127.1.1.1:5001/envio/cargos
 * * method: GET
 */
const enviocargos = (req, res) => {
    try {
    } catch (error) {
        console.log("error en la consunta en cuestion");
        res.status(400).send(error)
    }
}

/* 
 * me permite insertar envio 
 * http://127.1.1.1:5001/envio/insert
 * * method: POST
 * Data a enviar
{
    "nombre":"jhon",
    "fecha_ingreso":"2023-11-11",
    "IdCargoFk":1,
    "IdMunicipioFk":1
}
 * 
*/
const envioinsert = (req, res) => {
    try {
        let data = req.body;

    } catch (error) {
        console.log("error en la consunta en cuestion");
        res.status(400).send(error)
    }
}

/* 
 * me permite actulizar una envio 
 * http://127.1.1.1:5001/envio/update
 * method: PUT
 *  * Data a enviar
{
    "Id":1,
    "nombre":"2023-11-11",
    "fecha_ingreso":1,
    "IdCargoFk":1,
    "IdMunicipioFk":1
}
*/
const envioupdate = (req, res) => {
    try {

        let data = req.body;

    } catch (error) {
        console.log("error en la consunta en cuestion");
        res.status(400).send(error)
    }
}

/* 
 * me permite eliminar envio 
 * http://127.1.1.1:5001/envio/delete
 * method: DELETE
 * Data a enviar
{
    "Id": 5
}
*/
const enviodelete = (req, res) => {
    try {
        let Id = req.body.Id;
        
    } catch (error) {
        console.log("error en la consunta en cuestion");
        res.status(400).send(error)
    }
}

export {
    enviocargos,
    envioinsert,
    envioupdate,
    enviodelete,
    envioAll
}
