import mongoose from "mongoose";

const connectDatabase = async () => {
    // Check env variables presence
    if (!process.env.MONGODB_URI || !process.env.DB_NAME) {
        console.error(
          "Error: Missing environment variables MONGODB_URI or DB_NAME. Please check your .env file."
        );
        process.exit(1); // Exit with failure
      }
    try {
        const connectionInstance = await mongoose.connect(`${process.env.MONGODB_URI}/${process.env.DB_NAME}`)
        console.log(`\nMongoDB connected !! DB HOST : ${connectionInstance.connection.host}`);
    } catch (error) {
        console.error("Error: MongoDB connection failed. Please ensure your database is running and accessible.");
        console.error(`Details: ${error.message}`);
        process.exit(1)
        
    }
}

export default connectDatabase