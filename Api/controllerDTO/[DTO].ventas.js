import { body, validationResult } from "express-validator";
import { Router } from "express";

const dtoVenta = Router();

/* 
* Data que valida 
{
    "Fecha":2023-11-11,
    "IdEmpleadoFk":1,
    "IdClienteFk":1
    "IdFormaPagoFK":1
}
*/

const contendbody = [
    body('Fecha').notEmpty().withMessage("el campo Fecha no puede estar vacio")
        .isString().withMessage("El campo Fecha debe ser una fecha"),

    body('IdEmpleadoFk').notEmpty().withMessage("el campo IdEmpleadoFk no puede estar vacio")
        .isNumeric().withMessage("El campo IdEmpleadoFk debe ser un string").escape(),

    body('IdClienteFk').notEmpty().withMessage("el campo IdClienteFk no puede estar vacio")
        .isNumeric().withMessage("El campo IdClienteFk debe ser un string").escape(),

    body('IdFormaPagoFK').notEmpty().withMessage("el campo IdFormaPagoFK no puede estar vacio")
        .isNumeric().withMessage("El campo IdFormaPagoFK debe ser un string").escape(),
];

dtoVenta.use(contendbody, (req, res, next) => {
    let error = validationResult(req);
    if (!error.isEmpty()) {
        res.status(500).send({ error: 500, Message: "Error datos mal enviados" });
        console.log(error);
    } else {
        next();
    }
});


export default dtoVenta;