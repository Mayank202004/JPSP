import Application from "../models/application.model.js";
import { asyncHandler } from "../utils/asyncHandler.js";
import { ApiError } from "../utils/ApiError.js";
import { ApiResponse } from "../utils/ApiResponse.js";
import Profile from "../models/profile.model.js";
import Institute from "../models/institute.model.js";
import { Admin } from "../models/admin.model.js";
import { Notification } from "../models/notification.model.js";
import mongoose from "mongoose";


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

        console.log(instituteName);
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
        const applications = await Application.find({ userId: req.user._id })
        .populate({
            path: "scholarshipId",
            select: "title provider"
        })
        .populate({
            path: "to.authority",
            select: "role",
        })
        .populate({
            path: "currentRecipient",
            select: "role"
        });
        res.status(200).json(applications);
    } catch (error) {
        res.status(500).json({ error: error.message });
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

/**
 * @desc Approve an application
 * @route PUT /api/v1/applications/approve/:id
 * @access Private (Admins)
 */
export const approveApplication = asyncHandler(async (req, res) => {
    try {
        if(mongoose.Types.ObjectId.isValid(req.params.id) === false){
            throw new ApiError(400, "Invalid application ID");
        }

        const application = await Application.findById(req.params.id).populate('scholarshipId', 'title');
        if (!application) {
            throw new ApiError(404, "Application not found");
        }
        // Mark approve for current recipient
        if(application.currentRecipient !== req.user._id.toString()){
            throw new ApiError(403, "You are not the current recipient of this application");
        }
        for (let i = 0; i < application.to.length; i++) {
            if (application.to[i].authority === req.user._id.toString()) {
                if(application.to[i].status === "pending"){
                    application.to[i].status = "approved";
                }else{
                    throw new ApiError(400, "Cannot approve this application");
                }
                if(i < application.to.length - 1){
                    application.currentRecipient = application.to[i + 1].authority;
                }
                break;
            }
        }
        // Add notification to student 
        if(application.to.every(to => to.status === "approved")){
            application.status = "approved";
            Notification.create({
                to: application.userId,
                from: req.user._id,
                title: "Application Fully Approved",
                message: `Your application for scholarship ${application.scholarshipId.title} has been approved fully approved`
            });
        }
        else{
            Notification.create({
                to: application.userId,
                from: req.user._id,
                title: "Application Partially Approved",
                message: `Your application for scholarship ${application.scholarshipId.title} has been approved by ${req.user.role}`
            });
        }
        await application.save();

        res.status(200).json(new ApiResponse(200, application, "Application approved successfully"));
    } catch (error) {
        throw new ApiError(400, error.message);
    }
});

/**
 * @desc Reject an application
 * @route PUT /api/v1/applications/reject/:id
 * @access Private (Admins)
 */
export const rejectApplication = asyncHandler(async (req, res) => {
    const {reviewComment} = req.body;
    try {
        if(mongoose.Types.ObjectId.isValid(req.params.id) === false){
            throw new ApiError(400, "Invalid application ID");
        }

        if(!reviewComment || !reviewComment.trim()){
            throw new ApiError(400, "Review comment is required");
        }

        const application = await Application.findById(req.params.id).populate('scholarshipId', 'title');

        if (!application) {
            throw new ApiError(404, "Application not found");
        }
        // Mark reject for current recipient
        if(application.currentRecipient !== req.user._id.toString()){
            throw new ApiError(403, "You are not the current recipient of this application");
        }
        for (let i = 0; i < application.to.length; i++) {
            if (application.to[i].authority === req.user._id.toString()) {
                application.to[i].status = "rejected";
                application.status = "rejected";
                break;
            }
        }
        // Add notification to student 
        Notification.create({
            to: application.userId,
            from: req.user._id,
            title: "Application Rejected",
            message: `Your application for scholarship ${application.scholarshipId.title} has been rejected by ${req.user.role} with the following comment: ${reviewComment}`
        });
        application.reviewComments.push(reviewComment);
        await application.save();

        res.status(200).json(new ApiResponse(200, application, "Application rejected successfully"));
    } catch (error) {
        throw new ApiError(400, error.message);
    }
});

/**
 * @desc Return an application back to applicant (for changes)
 * @route PUT /api/v1/applications/return/:id
 * @access Private (Admins)
 */
export const returnApplication = asyncHandler(async (req, res) => {
    const {reviewComment} = req.body;
    try {
        if(mongoose.Types.ObjectId.isValid(req.params.id) === false){
            throw new ApiError(400, "Invalid application ID");
        }
        if(!reviewComment || !reviewComment.trim()){
            throw new ApiError(400, "Review comment is required");
        }

        const application = await Application.findById(req.params.id).populate('scholarshipId', 'title');
        if (!application) {
            throw new ApiError(404, "Application not found");
        }
        // Mark return for current recipient
        if(application.currentRecipient !== req.user._id.toString()){
            throw new ApiError(403, "You are not the current recipient of this application");
        }
        for (let i = 0; i < application.to.length; i++) {
            if (application.to[i].authority === req.user._id.toString()) {
                application.to[i].status = "returned back to applicant";
                application.status = "returned back to applicant";
                break;
            }
        }
        // Add notification to student 
        Notification.create({
            to: application.userId,
            from: req.user._id,
            title: "Application Returned",
            message: `Your application for scholarship ${application.scholarshipId.title} has been returned by ${req.user.role} with the following comment: ${reviewComment}`
        });
        application.reviewComments.push(reviewComment);
        await application.save();

        res.status(200).json(new ApiResponse(200, application, "Application returned successfully"));
    } catch (error) {
        throw new ApiError(400, error.message);
    }
});