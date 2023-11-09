import { Router } from "express";
import dtoVenta from "../controllerDTO/[DTO].ventas.js";
import dtoId from "../controllerDTO/[DTO].id.js";
import { limit } from "../middleware/limit.js";
import { 
    ventasJulio,
    ventasdelete,
    ventasinsert,
    ventasupdate
 } from "../controller/ventas.js";

const router = Router();

router.get('/julio', limit(), ventasJulio);
router.post('/insert', limit(), dtoVenta , ventasinsert);
router.put('/update', limit(), dtoId,dtoVenta,ventasupdate);
router.delete('/delete', limit(), dtoId,ventasdelete);

export default router;