import Scholarship from "../models/scholarship.model.js";
import { ApiError } from "../utils/ApiError.js";
import { ApiResponse } from "../utils/ApiResponse.js";
import validateScholarshipDetails from "../validators/scholarship.validator.js";

/**
 * @desc    Create a new scholarship
 * @route   POST /api/scholarships
 * @access  Protected (Admin)
 */
export const createScholarship = async (req, res) => {
    try {
        // Extract data from request body
        const scholarshipData = req.body;

        // Validate the input data
        const { errors } = validateScholarshipDetails(req.body);
            if (errors) {
                return res
                    .status(400)
                    .json(new ApiResponse(400, errors, "Validation error"));
            }

        // Save to database
        const newScholarship = await Scholarship.create(scholarshipData);


        return res.status(201).json(
            new ApiResponse(200, newScholarship, "Scholarship created successfully")
        );

    } catch (error) {
        console.error("Error creating scholarship:", error);
        return res.status(500).json({
            success: false,
            message: "Internal server error",
        });
    }
};

/**
 * @desc   Get all scholarships
 * @route  GET /api/scholarships
 * @access Public
 */
export const getAllScholarships = async (req, res) => {
    try {
        const scholarships = await Scholarship.find({});
        res.status(200).json(
            new ApiResponse(200, scholarships, "Scholarships fetched successfully")
        );
    } catch (error) {
        console.error("Error fetching scholarships:", error);
        throw new ApiError (500, `Server error. Unable to fetch scholarships. ${error.message}`);
    }
};

/**
 * @desc   Delete a scholarship by ID
 * @route  DELETE /api/scholarships/:id
 * @access Public (for now, can be secured later)
 */
export const deleteScholarship = async (req, res) => {
    try {
        const { id } = req.params;
        const scholarship = await Scholarship.findById(id);

        if (!scholarship) {
            throw new ApiError(404, "Scholarship not found");
        }

        await scholarship.deleteOne();
        res.status(200).json(
            new ApiResponse(200, null, "Scholarship deleted successfully")
        );
    } catch (error) {
        console.error("Error deleting scholarship:", error);
        throw new ApiError(500, `Server error. Unable to delete scholarship. ${error.message}`);
    }
};
