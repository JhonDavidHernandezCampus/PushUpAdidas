import { Router } from "express";
import dtoEmpleado from "../controllerDTO/[DTO].usuario.js";
import dtoId from "../controllerDTO/[DTO].id.js";
import { limit } from "../middleware/limit.js";
import { 
    usuarioAll,
    usuarioinsert,
    usuarioupdate,
    usuariodelete,
    usuarioJulio
 } from "../controller/usuario.js";

const router = Router();

router.get('/All', limit(), usuarioAll);
router.get('/julio', limit(), usuarioJulio);
router.get('/productos', limit() , usuarioinsert);
router.put('/update', limit(), dtoId,dtoEmpleado,usuarioupdate);
router.delete('/delete', limit(), dtoId,usuariodelete);

export default router;