import { MongoClient } from "mongodb";
import dotenv from 'dotenv';
dotenv.config();

const conx = async(req, res) => {
    try {
        let config = JSON.parse(process.env.MY_CONNECT);
        let url = `mongodb+srv://${config.user}:${config.password}@addidasdb.z7i5xcd.mongodb.net/${config.database}`;
        console.log(url);
        const conxi = await MongoClient.connect(url);
        console.log("Se ha conectado");
        return conxi.db();
    } catch (error) {
        console.log("Error in the conextion database");
        res.status(429).send({status:429, message:error});
    }
}



export default conx;