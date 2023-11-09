import React, { useState } from "react";
import Header from "./Header";
import Productos from "./Productos";


function Home() {
    const [count, setCount] = useState(0)
    return <>
        <div>
            <div className="">
                <Header />
            </div>
            <div className="p-28">
                <Productos  />
            </div>
            <div className="">
            
            </div>
        </div>
    </>
}

export default Home; 
