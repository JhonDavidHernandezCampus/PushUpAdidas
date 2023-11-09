import rateLimit from "express-rate-limit";

export let limit = () => {
    return rateLimit({
        windowMs: 30 * 1000,
        max: 5,
        standardHeaders: true,
        legacyHeaders: false,
        message: (req, res) => {
            res.status(429).send({
                status: 429,
                message: "Limite de peticiones alcanzado"
            })
        }
    })
}