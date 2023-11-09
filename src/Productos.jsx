import React, { useEffect, useState } from "react";
import { Card, CardHeader, CardBody, Image } from "@nextui-org/react";
import { Spinner } from "@nextui-org/react";

export default function Productos() {
    const [productosdb, setProductosdb] = useState([]);

    useEffect(() => {
        async function peticionDatos() {
            try {
                console.log("lega");
                let data = await fetch('http://localhost:5172/usuario/productos', {
                    method: "GET"
                });
                let datos = await data.json();
                setProductosdb(datos)
            } catch (error) {
                console.log("Pasamos por el error", error);
            }
        }
        peticionDatos();
    }, [])

    return (productosdb.length > 0) ?
        (
            productosdb.map((e, i) => {
                return ((
                    <Card className="py-4">
                        {console.log(productosdb)}
                        <CardHeader className="pb-0 pt-2 px-4 flex-col items-start ">
                            <p className="text-tiny uppercase font-bold">{e.descripcion}</p>
                            <small className="text-default-500">Precio: {e.precio}</small>
                            <h4 className="font-bold text-large">Color: {e.color}</h4>
                        </CardHeader>
                        <CardBody className="overflow-visible py-2">
                            <Image
                                alt="Card background"
                                className="object-cover rounded-xl"
                                src={e.urlimg}
                                width={270}
                            />
                        </CardBody>
                    </Card>
                ))
            })
        ) :
        (<div className="flex w-full justify-center items-center mt-56"><Spinner /></div>)

}
