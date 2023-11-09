import { body, validationResult } from "express-validator";
import { Router } from "express";

const dtoEmpleado = Router();

/* 
* Data que valida 
{
    "nombre":"jhon",
    "fecha_ingreso":"2023-11-11",
    "IdCargoFk":1,
    "IdMunicipioFk":1
}
 * 
*/

const contendbody = [
    body('nombre').notEmpty().withMessage("el campo nombre no puede estar vacio")
        .isString().withMessage("El campo nombre debe ser un string"),

    body('fecha_ingreso').notEmpty().withMessage("el campo fecha_ingreso no puede estar vacio")
        .isString().withMessage("El campo fecha_ingreso debe ser un string").escape(),

    body('IdCargoFk').notEmpty().withMessage("el campo IdCargoFk no puede estar vacio")
        .isNumeric().withMessage("El campo IdCargoFk debe ser un numerico").escape(),

    body('IdMunicipioFk').notEmpty().withMessage("el campo IdMunicipioFk no puede estar vacio")
        .isNumeric().withMessage("El campo IdMunicipioFk debe ser un numerico").escape(),
];

dtoEmpleado.use(contendbody, (req, res, next) => {
    let error = validationResult(req);
    if (!error.isEmpty()) {
        res.status(500).send({ error: 500, Message: "Error datos mal enviados" });
        console.log(error);
    } else {
        next();
    }
});


export default dtoEmpleado;