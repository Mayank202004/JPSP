import Institute from "../models/institute.model.js";
import { validateInstituteInput } from "../validators/institute.validator.js";
import { ApiResponse } from "../utils/ApiResponse.js";
import { ApiError } from "../utils/ApiError.js";
import { asyncHandler } from "../utils/asyncHandler.js";

/**
 * @desc Create a new institute
 * @route POST /api/institutes
 * @access Private (Admin only)
 */
export const createInstitute = asyncHandler(async (req, res) => {
    try {
        const { errors,value } = validateInstituteInput(req.body);
        if (errors) {
            return res
                .status(400)
                .json(new ApiResponse(400, errors, "Validation error"));
        }
        const institute = new Institute(value);
        await institute.save();
        res.status(201).json(new ApiResponse(201, institute, "Institute created successfully"));
    } catch (error) {
        throw new ApiError(400, error.message);
    }
});

/**
 * @desc Get all institutes
 * @route GET /api/institutes
 * @access Public
 */
export const getAllInstitutes = asyncHandler(async (req, res) => {
    try {
        const institutes = await Institute.find();
        res.status(200).json(new ApiResponse(200, institutes, "All institutes"));   
    } catch (error) {
        throw new ApiError(500, error.message);
    }
});

/**
 * @desc Get an institute by ID
 * @route GET /api/institutes/:id
 * @access Public
 */
export const getInstituteById = asyncHandler(async (req, res) => {
    try {
        const institute = await Institute.findById(req.params.id);
        if (!institute) {
            throw new ApiError(404, "Institute not found");
        }
        res.status(200).json(new ApiResponse(200, institute, "Institute"));
    } catch (error) {
        throw new ApiError(500, error.message);
    }
});

/**
 * @desc Update an institute
 * @route PUT /api/institutes/:id
 * @access Private (Admin only)
 */
export const updateInstitute = asyncHandler(async (req, res) => {
    try {
        const institute = await Institute.findByIdAndUpdate(req.params.id, req.body, { new: true, runValidators: false });
        if (!institute) {
            throw new ApiError(404, "Institute not found");
        }
        res.status(200).json(new ApiResponse(200, institute, "Institute updated successfully"));
    } catch (error) {
        throw new ApiError(400, error.message);
    }
});

/**
 * @desc Delete an institute
 * @route DELETE /api/institutes/:id
 * @access Private (Admin only)
 */
export const deleteInstitute = asyncHandler(async (req, res) => {
    try {
        const institute = await Institute.findByIdAndDelete(req.params.id);
        if (!institute) {
            throw new ApiError(404, "Institute not found");
        }
        res.status(200).json(new ApiResponse(200, null, "Institute deleted successfully"));
    } catch (error) {
        throw new ApiError(500, error.message);
    }
});