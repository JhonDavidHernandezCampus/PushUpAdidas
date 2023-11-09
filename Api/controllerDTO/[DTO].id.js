import { body, validationResult } from "express-validator";
import { Router } from "express";
const dtoId = Router();

/* 
* Data que valida 
{
    "Id":2
}
*/

const contenBody = [
    body("Id").notEmpty().withMessage("Debe mandar un Id")
    .isNumeric().withMessage("El id debe ser entero")
]

dtoId.use(contenBody, (req,res,next)=>{
    let error = validationResult(req);
    if (!error.isEmpty()) {
        res.status(500).send({ error: 500, Message: "Error Id no valido" });
        console.log(error);
    } else {
        next();
    }
})

export default dtoId;