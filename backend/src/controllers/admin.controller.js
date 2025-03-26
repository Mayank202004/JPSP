import Admin from "../models/admin.model.js";
import { User } from "../models/user.model.js";
import { ApiResponse } from "../utils/ApiResponse.js";
import { validateAdminInput } from "../validators/admin.validator.js";
import { ApiError } from "../utils/ApiError.js";
import { asyncHandler } from "../utils/asyncHandler.js";

/**
 * @desc Create a new admin
 * @route POST /api/v1/admins
 * @access Private (Super Admin only)
 */
export const createAdmin = asyncHandler(async (req, res) => {
    try {
        const { userId, position, instituteId, scholarshipId } = req.body;

        if (!userId || !position || (!scholarshipId && !instituteId)) {
            throw new ApiError(400, "User ID, Position, and either Scholarship ID or Institute ID are required");
        }
            
       let errors, value;

        if (instituteId) {
            ({ errors, value } = validateAdminInput({ userId, position, instituteId }));
        } else {
            ({ errors, value } = validateAdminInput({ userId, position, scholarshipId }));
        }
        if (errors) {
            return res.status(400).json(new ApiResponse(400, errors, "Validation error"));
        }

        
        // Check if user exists
        const userExists = await User.findById(userId);
        if (!userExists) {
            throw new ApiError(404, "User not found");
        }
        if(userExists.role == "user"){
            throw new ApiError(400, "User is not an admin");
        }    


        const admin = new Admin({ userId, position, instituteId, scholarshipId });
        await admin.save();
        res.status(201).json(new ApiResponse(201, admin, "Admin created successfully"));
    } catch (error) {
        throw new ApiError(400, error.message);
    }
});

/**
 * @desc Get all admins
 * @route GET /api/v1/admins
 * @access Private (Super Admin only)
 */
export const getAllAdmins = asyncHandler(async (req, res) => {
    try {
        const admins = await Admin.find().populate("userId instituteId scholarshipId");
        res.status(200).json(new ApiResponse(200, admins, "All admins"));
    } catch (error) {
        throw new ApiError(500, error.message);
    }
});

/**
 * @desc Get an admin by ID
 * @route GET /api/v1/admins/:id
 * @access Private (Super Admin only)
 */
export const getAdminById = asyncHandler(async (req, res) => {
    try {
        const admin = await Admin.findById(req.params.id).populate("userId instituteId scholarshipId");
        if (!admin) {
            throw new ApiError(404, "Admin not found");
        }
        res.status(200).json(new ApiResponse(200, admin, "Admin"));
    } catch (error) {
        throw new ApiError(500, error.message);
    }
});

/**
 * @desc Update an admin
 * @route PUT /api/v1/admins/:id
 * @access Private (Super Admin only)
 */
export const updateAdmin = asyncHandler(async (req, res) => {
    try {
        const { position, instituteId, scholarshipId } = req.body;
        const admin = await Admin.findById(req.params.id);
        if (!admin) {
            throw new ApiError(404, "Admin not found");
        }

        if (position) admin.position = position;
        if (instituteId !== undefined) admin.instituteId = instituteId;
        if (scholarshipId !== undefined) admin.scholarshipId = scholarshipId;
        
        await admin.save();
        res.status(200).json(new ApiResponse(200, admin, "Admin updated successfully"));
    } catch (error) {
        throw new ApiError(400, error.message);
    }
});

/**
 * @desc Delete an admin
 * @route DELETE /api/v1/admins/:id
 * @access Private (Super Admin only)
 */
export const deleteAdmin = asyncHandler(async (req, res) => {
    try {
        const admin = await Admin.findByIdAndDelete(req.params.id);
        if (!admin) {
            throw new ApiError(404, "Admin not found");
        }
        res.status(200).json(new ApiResponse(200, admin, "Admin deleted successfully"));
    } catch (error) {
        throw new ApiError(500, error.message);
    }
});
