import multer from "multer";
import crypto from "crypto";
import path from "path";

// Multer storage configuration
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, "./public/temp");
    },
    filename: function (req, file, cb) {
        // Generate a random unique file name with a secure hash
        const uniqueSuffix = crypto.randomBytes(16).toString("hex");
        const extension = path.extname(file.originalname); // Get original file extension
        cb(null, `${uniqueSuffix}${extension}`);
    },
});

export const upload = multer({
    storage,
});
