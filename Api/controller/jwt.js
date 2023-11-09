import express from 'express';
import dotenv from 'dotenv';
import {SignJWT, jwtVerify } from 'jose';
dotenv.config();

const jwt = express();

jwt.get('/:id_usu/:nombre_usu', async (req,res)=>{
    let params = req.params;
    if (!(isNaN(Number(params.id_usu)) && typeof(params.nombre_usu) === 'string')) {
        let json = {
            id:params.id_usu,
            nombre:params.nombre_usu
        }
        const encoder = new TextEncoder();
        const jwtconstructor = new SignJWT({json});
        const jwt = await jwtconstructor
        .setProtectedHeader({alg:"HS256",typ:"JWT"})
        .setIssuedAt()
        .setExpirationTime("30m")
        .sign(encoder.encode(process.env.CLAVE_FIRMA));
        res.send({jwt})

    }else{
        console.log({ "Message": "Error en los parametros" });
        res.send({ "Message": "Error, Parametros enviados incorrectamente"});
    }
})

async function validartoken(req,res,next){
    let {authorization} = req.headers;
    if(authorization){
        try {
            const encoder = new TextEncoder();
            const jwtData= await jwtVerify(
                authorization,
                encoder.encode(process.env.CLAVE_FIRMA)
            );
            next();
        } catch (error) {
            res.status(400).send({"Message":"Token de usuario no valido, (Posiblemente ya expirado)"})
        }
    }else{
        res.status(400).send({Message:"No tienes permisos para hacer este tramite"});
    }
}

const jwtModule = {
    jwt:jwt,
    validartoken:validartoken
}

export default jwtModule; 