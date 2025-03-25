import Application from "../models/Application.js";

// Create a new application
export const createApplication = async (req, res) => {
    try {
        const { profileId, scholarshipId } = req.body;
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
};

// Get all applications
export const getAllApplications = async (req, res) => {
    try {
        const applications = await Application.find().populate("profileId scholarshipId");
        res.status(200).json(applications);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// Get a single application by ID
export const getApplicationById = async (req, res) => {
    try {
        const application = await Application.findById(req.params.id).populate("profileId scholarshipId");
        if (!application) {
            return res.status(404).json({ message: "Application not found" });
        }
        res.status(200).json(application);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// Update application status
export const updateApplicationStatus = async (req, res) => {
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
};

// Delete an application
export const deleteApplication = async (req, res) => {
    try {
        const application = await Application.findByIdAndDelete(req.params.id);
        if (!application) {
            return res.status(404).json({ message: "Application not found" });
        }
        res.status(200).json({ message: "Application deleted successfully" });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};
