import mysql from 'mysql2';
import dotenv from 'dotenv';

dotenv.config();

let config = JSON.parse(process.env.MY_CONNECT)

const credentials = {
    host:config.host,
    user: config.user,
    password: config.password,
    database: config.database,
    multipleStatements: true
}

const conx = mysql.createPool(credentials);

export default conx;