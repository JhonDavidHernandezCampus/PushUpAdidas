import conx from "../db/conx.js";


/* 
 * Esta consulta me retorn las ventas que se realizaron en el mes de julio de 2023
 * http://127.1.1.1:5001/ventas/julio
 * * method: GET
 */
const ventasJulio = (req, res) => {
    try {
        let query = `SELECT * FROM venta WHERE Fecha > '2023-07-01' and Fecha < '2023-07-28';`;
        conx.query(query, (err, respuesta, fill) => {
            if (err) {
                throw { message: err, status: 400 }
            } else {
                res.send(respuesta)
            }
        });
    } catch (error) {
        console.log("error en la consunta en cuestion");
        res.status(400).send(error)
    }
}

/* 
 * me permite insertar ventas 
 * http://127.1.1.1:5001/ventas/insert
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
const ventasinsert = (req, res) => {
    try {
        let data = req.body;
        let query = `INSERT INTO venta(Fecha, IdEmpleadoFk, IdClienteFk, IdFormaPagoFk)
        VALUES ("${data.Fecha}", ${data.IdEmpleadoFk}, ${data.IdClienteFk}, ${data.IdFormaPagoFK});`;
        conx.query(query, (err, respuesta, fill) => {
            if (err) {
                throw { message: err, status: 400 }
            } else {
                if (respuesta.affectedRows >= 1) {
                    res.status(200).send({ status: 200, message: "El registro ha sido Insertado" })
                }
            }
        });
    } catch (error) {
        console.log("error en la consunta en cuestion");
        res.status(400).send(error)
    }
}

/* 
 * me permite actulizar una venta 
 * http://127.1.1.1:5001/ventas/update
 * method: PUT
 *  * Data a enviar
{
    "Fecha":"2023-11-11",
    "IdEmpleadoFk":1,
    "IdClienteFk":1,
    "IdFormaPagoFK":1
}
*/
const ventasupdate = (req, res) => {
    try {

        let data = req.body;
        let query = `UPDATE venta
        SET Fecha = "${data.Fecha}",
        IdEmpleadoFk = ${data.IdEmpleadoFk},
        IdClienteFk = ${data.IdClienteFk},
        IdFormaPagoFK = ${data.IdFormaPagoFK}
        WHERE Id = ${data.Id};`;

        conx.query(query, (err, respuesta, fill) => {
            if (err) {
                throw { message: err, status: 400 }
            } else {
                res.send(respuesta)
            }
        });
    } catch (error) {
        console.log("error en la consunta en cuestion");
        res.status(400).send(error)
    }
}

/* 
 * me permite eliminar ventas 
 * http://127.1.1.1:5001/ventas/delete
 * method: DELETE
 * Data a enviar
{
    "Id": 5,
    "Fecha":"2023-11-11",
    "IdEmpleadoFk":1,
    "IdClienteFk":1,
    "IdFormaPagoFK":1
}
*/
const ventasdelete = (req, res) => {
    try {
        let Id = req.body.Id;
        console.log(Id);
        let query = `DELETE FROM venta WHERE Id =${Id} ;`;
        conx.query(query, (err, respuesta, fill) => {
            if (err) {
                throw { message: err, status: 400 }
            } else {
                res.status(200).send({ status: 200, message: "El registro ha sido eliminado" })
            }
        });
    } catch (error) {
        console.log("error en la consunta en cuestion");
        res.status(400).send(error)
    }
}

export {
    ventasJulio,
    ventasinsert,
    ventasupdate,
    ventasdelete
}
