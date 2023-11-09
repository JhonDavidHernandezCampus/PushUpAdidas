import dotenv from 'dotenv';
import express  from 'express';

import routesEnvio from './routes/[routes]envio.js';
import routesUsuario from './routes/[routes]usuario.js'
import jwtModule from './controller/jwt.js';

dotenv.config();
const appExpress = express();

appExpress.use(express.json());
appExpress.use(express.text());



appExpress.use('/envio', jwtModule.validartoken,routesEnvio);
appExpress.use('/usuario', jwtModule.validartoken,routesUsuario);
appExpress.use('/token', jwtModule.jwt );


let config = JSON.parse(process.env.MY_CONFIG);

appExpress.listen(config,()=>{
    console.log(`http://${config.hostname}:${config.port}`);
});  