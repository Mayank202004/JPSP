import { asyncHandler } from "../utils/asyncHandler.js";
import { ApiError } from "../utils/ApiError.js";
import { ApiResponse } from "../utils/ApiResponse.js";
import * as profileValidator from "../validators/profile.validator.js";
import { uploadOnCloudinary } from "../utils/cloudinary.js";
import Profile from "../models/profile.model.js";
import path from "path";

const addPersonalInfo = asyncHandler(async (req, res) => {
    const {
        fullName,
        dob,
        age,
        aadharNumber,
        mobile,
        gender,
        parentMobile,
        maritalStatus,
        religion,
        casteCategory,
        email,
    } = req.body;

    // Check if empty fields
    if (
        [
            fullName,
            dob,
            age,
            aadharNumber,
            mobile,
            gender,
            parentMobile,
            maritalStatus,
            religion,
            casteCategory,
            email,
        ].some((field) => field?.trim() === "")
    ) {
        throw new ApiError(400, "All fields are required");
    }

    // Validate user input
    // const { errors } = profileValidator.validatePersonalDetails(req.body);
    // if (errors) {
    //     return res
    //         .status(400)
    //         .json(new ApiResponse(400, errors, "Validation error"));
    // }
    // Get adhaar card from multer and upload to cloudinary
    let aadharLocalPath;
    if (!req.file || !req.file.path) {
        throw new ApiError(400, "Aadhar photo is required");
    }
    aadharLocalPath = req.file.path;

    // Check if file is an image
    const allowedExtensions = [".jpeg", ".jpg", ".png"];
    const fileExtension = path
        .extname(req.file.originalname)
        .toLowerCase();
    if (!allowedExtensions.includes(fileExtension)) {
        throw new ApiError(
            400,
            "Invalid file type. Only JPEG, JPG, and PNG are allowed."
        );
    }

    const aadhar = await uploadOnCloudinary(aadharLocalPath);
    if (!aadhar) {
        throw new ApiError(400, "Error uploading Aadhar card to Cloudinary");
    }

    // Add or update personal details
    try {
        const updatedProfile = await Profile.findOneAndUpdate(
            { userId: req.user._id },
            {
                personalDetails: {
                    fullName,
                    dob,
                    age,
                    aadharNumber,
                    aadharCard: aadhar?.url || "",
                    mobile,
                    gender,
                    parentMobile,
                    maritalStatus,
                    religion,
                    casteCategory,
                    email,
                },
                isPersonalDetailsFilled: true,
                userId: req.user._id,
            },
            { new: true, runValidators: false, upsert: true }
        );
        if (!updatedProfile) {
            throw new ApiError(500, "Error updating personal details");
        }
        return res
            .status(200)
            .json(
                new ApiResponse(
                    200,
                    updatedProfile,
                    "Personal details updated successfully"
                )
            );
    } catch (error) {
        throw new ApiError(500, "Error updating personal details");
    }
});

export { addPersonalInfo };