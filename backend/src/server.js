import { configDotenv } from "dotenv";
import connectDatabase from "./config/database.js";
import { app } from "./app.js";

configDotenv({
    path: './.env'
})

connectDatabase()
.then(() => {
    app.listen(process.env.PORT || 8000, () => {
        console.log(`Server is running at port : ${process.env.PORT}`);
    })
})
.catch((error) =>{
    console.error("MongoDB connection failed")
    console.error(`Details : ${error}`)
    process.exit(1);
})