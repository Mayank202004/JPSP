import connectDatabase from "./config/database.js";
import { app } from "./app.js";


connectDatabase()
    .then(() => {
        app.listen(process.env.PORT || 8000, () => {
            console.log(`Server is running at port : ${process.env.PORT}`);
        });
    })
    .catch((error) => {
        console.error("MongoDB connection failed");
        console.error(`Details : ${error}`);
        process.exit(1);
    });

// Routes Imports
import userRouter from "./routes/user.routes.js";
import profileRouter from "./routes/profile.routes.js";
import scholarshipRouter from "./routes/scholarship.routes.js";
import instituteRouter from "./routes/institute.routes.js";
import adminRouter from "./routes/admin.routes.js";

// Routes Declarations
app.use("/api/v1/users", userRouter);
app.use("/api/v1/profile", profileRouter);
app.use("/api/v1/scholarship", scholarshipRouter);
app.use("/api/v1/institutes", instituteRouter);
app.use("/api/v1/admins", adminRouter);
