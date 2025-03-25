import { Admin } from "../models/admin.model.js";
import { User } from "../models/user.model.js";
import { ApiResponse } from "../utils/ApiResponse.js";
import { validateAdminInput } from "../validators/admin.validator.js";
import { ApiError } from "../utils/ApiError.js";

/**
 * @desc Create a new admin
 * @route POST /api/admins
 * @access Private (Super Admin only)
 */
export const createAdmin = async (req, res) => {
    try {
        const { userId, position, instituteId, scholarshipId } = req.body;
        
        // Check if user exists
        const userExists = await User.findById(userId);
        if (!userExists) {
            throw new ApiError(404, "User not found");
        }

        const { errors,value } = validateAdminInput({iserId, position, instituteId, scholarshipId});
                if (errors) {
                    return res
                        .status(400)
                        .json(new ApiResponse(400, errors, "Validation error"));
                }

        const admin = new Admin({ userId, position, instituteId, scholarshipId });
        await admin.save();
        res.status(201).json(new ApiResponse(201, admin, "Admin created successfully"));
    } catch (error) {
        throw new ApiError(400, error.message);
    }
};

/**
 * @desc Get all admins
 * @route GET /api/admins
 * @access Private (Super Admin only)
 */
export const getAllAdmins = async (req, res) => {
    try {
        const admins = await Admin.find().populate("userId instituteId scholarshipId");
        res.status(200).json(new ApiResponse(200, admins, "All admins"));
    } catch (error) {
        throw new ApiError(500, error.message);
    }
};

/**
 * @desc Get an admin by ID
 * @route GET /api/admins/:id
 * @access Private (Super Admin only)
 */
export const getAdminById = async (req, res) => {
    try {
        const admin = await Admin.findById(req.params.id).populate("userId instituteId scholarshipId");
        if (!admin) {
            throw new ApiError(404, "Admin not found");
        }
        res.status(200).json(new ApiResponse(200, admin, "Admin"));
    } catch (error) {
        throw new ApiError(500, error.message);
    }
};

/**
 * @desc Update an admin
 * @route PUT /api/admins/:id
 * @access Private (Super Admin only)
 */
export const updateAdmin = async (req, res) => {
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
};

/**
 * @desc Delete an admin
 * @route DELETE /api/admins/:id
 * @access Private (Super Admin only)
 */
export const deleteAdmin = async (req, res) => {
    try {
        const admin = await Admin.findByIdAndDelete(req.params.id);
        if (!admin) {
            throw new ApiError(404, "Admin not found");
        }
        res.status(200).json(new ApiResponse(200, admin, "Admin deleted successfully"));
    } catch (error) {
        throw new ApiError(500, error.message);
    }
};
