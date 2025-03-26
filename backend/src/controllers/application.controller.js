import Application from "../models/application.model.js";
import { asyncHandler } from "../utils/asyncHandler.js";
import { ApiError } from "../utils/ApiError.js";
import { ApiResponse } from "../utils/ApiResponse.js";
import Profile from "../models/profile.model.js";
import Institute from "../models/institute.model.js";
import Admin from "../models/admin.model.js";



/**
 * @desc Create a new application
 * @route POST /api/v1/applications
 * @access Private (Students)
 */
export const createApplication = asyncHandler(async (req, res) => {
    try {
        const { scholarshipId } = req.body;

        if (!scholarshipId || !scholarshipId.trim()) {
            throw new ApiError(400, "Scholarship ID is required");
        }

        // Find profile based on the logged-in user
        const profile = await Profile.findOne({ userId: req.user._id });
        if (!profile) {
            throw new ApiError(404, "Profile not found for the logged-in user");
        }
        // Check if profile is completely filled
        if(
            !profile.isPersonalDetailsFilled ||
            !profile.isAddressFilled ||
            !profile.isBankDetailsFilled ||
            !profile.isCurrentQualificationsFilled ||
            !profile.isDomicileDetailsFilled ||
            !profile.isHostelDetailsFilled ||
            !profile.isIncomeDetailsFilled ||
            !profile.isParentsDetailsFilled ||
            !profile.isPastQualificationsFilled
        ){
            throw new ApiError(400, "Profile is not completely filled");
        }

        const instituteName = profile.currentQualification?.[0]?.instituteName;
        if (!instituteName) {
            throw new ApiError(400, "Institute name not found in profile");
        }

        const institute = await Institute.findOne({ name: instituteName });
        if (!institute) {
            throw new ApiError(404, "Institute not found");
        }
        const instituteId = institute._id;


        const instituteAdmin = await Admin.findOne({ instituteId,position: "Desk 1 Officer" });
        if (!instituteAdmin) {
            throw new ApiError(404, "Institute Admin not found");
        }
        const desk2Admin = await Admin.findOne({ scholarshipId, position: "Desk 2 Officer" });
        if (!desk2Admin) throw new ApiError(404, "Desk 2 Officer not found");
        const ddoAdmin = await Admin.findOne({ scholarshipId, position: "DDO" });
        if (!ddoAdmin) throw new ApiError(404, "DDO not found");

        const to = [
            { authority: instituteAdmin.userId.toString() }, // Desk 1 of students institute
            { authority: desk2Admin.userId.toString() },     // Desk 2 as per scholarship
            { authority: ddoAdmin.userId.toString() }       // DDO as per scholarship
        ];

        const application = new Application({
            userId: req.user._id,
            profileId: profile._id,
            scholarshipId,
            to,
            currentRecipient: to[0].authority, 
        });

        await application.save();
        res.status(201).json(new ApiResponse(201, application, "Application created successfully"));

    } catch (error) {
        throw new ApiError(400, error.message);
    }
});

/**
 * @desc Get all applications
 * @route GET /api/v1/applications
 * @access Private (Admins)
 */
export const getAllApplications = asyncHandler(async (req, res) => {
    try {
        const applications = await Application.find().populate("profileId scholarshipId");
        res.status(200).json(applications);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

/**
 * @desc Get application by ID
 * @route GET /api/v1/applications/:id
 * @access Private (Admins)
 */
export const getApplicationById = asyncHandler(async (req, res) => {
    try {
        const application = await Application.findById(req.params.id).populate("profileId scholarshipId");
        if (!application) {
            return res.status(404).json({ message: "Application not found" });
        }
        res.status(200).json(application);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

/**
 * @desc Get all pending applications
 * @route GET /api/v1/applications/pending
 * @access Private (Admins)
 */
export const getPendingApplications = asyncHandler(async (req, res) => {
    try {
        const applications = await Application.find({ status: "pending", currentRecipient: req.user._id}).populate("profileId scholarshipId");
        res.status(200).json(applications);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

/**
 * @desc Get all applications of logged-in user
 * @route GET /api/v1/applications/me
 * @access Private (Students)
 */
export const getMyApplications = asyncHandler(async (req, res) => {
    try {
        const applications = await Application.find({ profileId: req.user._id }).populate("profileId scholarshipId");
        res.status(200).json(applications);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// Update application status
export const updateApplicationStatus = asyncHandler(async (req, res) => {
    try {
        const { status, reviewComments, currentRecipient } = req.body;
        const application = await Application.findById(req.params.id);
        if (!application) {
            return res.status(404).json({ message: "Application not found" });
        }
        
        if (status) application.status = status;
        if (reviewComments) application.reviewComments.push(reviewComments);
        if (currentRecipient) application.currentRecipient = currentRecipient;
        
        await application.save();
        res.status(200).json(application);
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
});

// Delete an application
export const deleteApplication = asyncHandler(async (req, res) => {
    try {
        const application = await Application.findByIdAndDelete(req.params.id);
        if (!application) {
            return res.status(404).json({ message: "Application not found" });
        }
        res.status(200).json({ message: "Application deleted successfully" });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});
