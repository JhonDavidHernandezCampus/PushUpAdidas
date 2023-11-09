import dotenv from 'dotenv';
import express  from 'express';
import routesVentas from './routes/[routes]ventas.js';
import jwtModule from './controller/jwt.js';

dotenv.config();
const appExpress = express();

appExpress.use(express.json());
appExpress.use(express.text());


appExpress.use('/ventas', jwtModule.validartoken,routesVentas);
appExpress.use('/token', jwtModule.jwt );


let config = JSON.parse(process.env.MY_CONFIG);

appExpress.listen(config,()=>{
    console.log(`http://${config.hostname}:${config.port}`);
});  