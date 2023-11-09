import { Router } from "express";
import dtoEnvio from "../controllerDTO/[DTO].envio.js";
import dtoId from "../controllerDTO/[DTO].id.js";
import { limit } from "../middleware/limit.js";
import { 
    envioAll,
    enviodelete,
    envioinsert,
    envioupdate
} from "../controller/envio.js";

const router = Router();

router.get('/all', limit(), envioAll);
router.post('/insert', limit(), dtoEnvio , envioinsert);
router.put('/update', limit(), dtoId, dtoEnvio ,envioupdate);
router.delete('/delete', limit(), dtoId,enviodelete);

export default router;