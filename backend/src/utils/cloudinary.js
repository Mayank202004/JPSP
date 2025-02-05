import { v2 as cloudinary } from "cloudinary";
import fs from "fs";

// Configuration
cloudinary.config({
    cloud_name: process.env.CLOUDINARY_CLOUD_NAME,
    api_key: process.env.CLOUDINARY_API_KEY,
    api_secret: process.env.CLOUDINARY_API_SECRET,
});

const uploadOnCloudinary = async (localFilePath) => {
    try {
        if (!localFilePath) return null;
        //upload the file on cloudinary
        const response = await cloudinary.uploader.upload(localFilePath, {
            resource_type: "auto",
        });
        fs.unlinkSync(localFilePath);
        return response;
    } catch (error) {
        fs.unlinkSync(localFilePath); // remove the locally saved temporary file as the upload operation got failed
        return null;
    }
};

const deleteFromCloudinary = async (url) => {
    try {
        if (!url) {
            throw new Error("URL is required to delete a file from Cloudinary");
        }
        // Extract the public ID from the Cloudinary URL
        const urlParts = url.split("/");
        const publicIdWithExtension = urlParts[urlParts.length - 1]; // Get the last part of the URL
        const publicId = publicIdWithExtension.split(".")[0]; // Remove the file extension

        if (!publicId) {
            throw new Error("Unable to extract public ID from the URL");
        }
        await cloudinary.uploader.destroy(publicId);
    } catch (error) {
        // No catch (Proceed without deleting)
        console.log(error);
        throw new Error("Failed to delete file from Cloudinary");
    }
};

export { uploadOnCloudinary, deleteFromCloudinary };
