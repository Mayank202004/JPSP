import { asyncHandler } from "../utils/asyncHandler.js";
import { ApiError } from "../utils/ApiError.js";
import { ApiResponse } from "../utils/ApiResponse.js";
import * as profileValidator from "../validators/profile.validator.js";
import { uploadOnCloudinary, deleteFromCloudinary } from "../utils/cloudinary.js";
import Profile from "../models/profile.model.js";
import path from "path";

/**
 * @desc add personal information of user
 * @route POST /api/profile/personalinfo
 * @access Private
 */
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

    //Validate user input
    const { errors } = profileValidator.validatePersonalDetails(req.body);
    if (errors) {
        return res
            .status(400)
            .json(new ApiResponse(400, errors, "Validation error"));
    }
    // Get adhaar card from multer and upload to cloudinary
    let aadharLocalPath;
    if (!req.file || !req.file?.path) {
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

    // Delete old file from cloudinary if exists
    const existingProfile = await Profile.findOne({ userId: req.user._id });
    if (existingProfile && existingProfile.personalDetails.aadharCard) {
        const oldAadharUrl = existingProfile.personalDetails.aadharCard;
        await deleteFromCloudinary(oldAadharUrl);
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

/**
 * @desc add income information of user
 * @route POST /api/profile/incomeinfo
 * @access Private
 */
const addIncomeInfo = asyncHandler(async (req, res) => {
    const {familyIncome,incomeCertificateNumber,incomeIssuingAuthority,incomeCertificateIssuedDate} = req.body;

    // Validate user input
    const { errors } = profileValidator.validateIncomeDetails(req.body);
    if (errors) {
        return res
            .status(400)
            .json(new ApiResponse(400, errors, "Validation error"));
    }

    if(!req.file || !req.file?.path){
        throw new ApiError(400,"Income Certificate is required");
    }
    // Delete from cloudinary if already exists
    const existingProfile = await Profile.findOne({ userId: req.user._id });
    if (existingProfile && existingProfile.incomeDetails.incomeCertificate) {
        const oldCertificateUrl = existingProfile.incomeDetails.incomeCertificate;
        await deleteFromCloudinary(oldCertificateUrl);
    }

    const incomeLocalPath = req.file.path;
    const incomeCertificate = await uploadOnCloudinary(incomeLocalPath);
    if(!incomeCertificate || !incomeCertificate.url){
        throw new ApiError(400,"Error uploading income certificate to cloudinary");
    }
    try {
        const updatedUser = await Profile.findOneAndUpdate(
            {userId: req.user._id},
            {
                incomeDetails: {
                    familyIncome,
                    incomeCertificateNumber,
                    incomeIssuingAuthority,
                    incomeCertificate: incomeCertificate.url,
                    incomeCertificateIssuedDate
                },
                isIncomeDetailsFilled: true,

            },
            { new: true, runValidators: false, upsert: true }
        );
        if(!updatedUser){
            throw new ApiError(500,"Error updating income information");
        }
        return res.status(200).json(
            new ApiResponse(200,updatedUser,"income details updated successfully")
        );
    } catch (error) {
        throw new ApiError(500,"Error updating income details");
    }
});

/**
 * @desc add domicile information of user
 * @route POST /api/profile/domicileinfo
 * @access Private
 */ 
const addDomicileInfo = asyncHandler(async (req, res) => {
    const {domicileCertificateNumber,domicileIssuingAuthority,domicileIssuingDate} = req.body;

    // Validate user input
    const { errors } = profileValidator.validateDomicileDetails(req.body);
    if (errors) {
        return res
            .status(400)
            .json(new ApiResponse(400, errors, "Validation error"));
    }

    if(!req.file || !req.file?.path){
        throw new ApiError(400,"Domicile Certificate is required");
    }
    // Delete from cloudinary if already exists
    const existingProfile = await Profile.findOne({ userId: req.user._id });
    if (existingProfile && existingProfile.domicileDetails.domicileCertificate) {
        const oldCertificateUrl = existingProfile.domicileDetails.domicileCertificate;
        await deleteFromCloudinary(oldCertificateUrl);
    }

    const domicileLocalPath = req.file.path;
    const domicileCertificate = await uploadOnCloudinary(domicileLocalPath);
    if(!domicileCertificate || !domicileCertificate.url){
        throw new ApiError(400,"Error uploading domicile certificate to cloudinary");
    }
    try {
        const updatedUser = await Profile.findOneAndUpdate(
            {userId: req.user._id},
            {
                domicileDetails: {
                    domicileCertificateNumber,
                    domicileIssuingAuthority,
                    domicileIssuingDate,
                    domicileCertificate: domicileCertificate.url
                },
                isDomicileDetailsFilled: true,
            },
            { new: true, runValidators: false, upsert: true }
        );
        if(!updatedUser){
            throw new ApiError(500,"Error updating domicile information");
        }
        return res.status(200).json(
            new ApiResponse(200,updatedUser,"domicile details updated successfully")
        );
    } catch (error) {
        throw new ApiError(500,"Error updating domicile details");
    }
});

/**
 * @desc add bank information of user
 * @route POST /api/profile/bankinfo
 * @access Private
 */ 
const addBankInfo = asyncHandler(async (req, res) => {
    const {accountNumber,ifsc,bankName,branchName} = req.body;

    // Validate user input
    const { errors } = profileValidator.validateBankDetails(req.body);
    if (errors) {
        return res
            .status(400)
            .json(new ApiResponse(400, errors, "Validation error"));
    }

    try {
        const updatedUser = await Profile.findOneAndUpdate(
            {userId: req.user._id},
            {
                bankDetails: {
                    accountNumber,
                    ifsc,
                    bankName,
                    branchName
                },
                isBankDetailsFilled: true,
            },
            { new: true, runValidators: false, upsert: true }
        );
        if(!updatedUser){
            throw new ApiError(500,"Error updating bank information");
        }
        return res.status(200).json(
            new ApiResponse(200,updatedUser,"bank details updated successfully")
        );
    } catch (error) {
        throw new ApiError(500,"Error updating bank details");
    }
});

/**
 * @desc add address information of user
 * @route POST /api/profile/addressinfo
 * @access Private
 */ 
const addAddressInfo = asyncHandler(async (req, res) => {
    const {address,city,taluka,district,state,pincode} = req.body;

    // Validate user input
    const { errors } = profileValidator.validateAddressDetails(req.body);
    if (errors) {
        return res
            .status(400)
            .json(new ApiResponse(400, errors, "Validation error"));
    }

    try {
        const updatedUser = await Profile.findOneAndUpdate(
            {userId: req.user._id},
            {
                address: {
                    address,
                    city,
                    taluka,
                    district,
                    state,
                    pincode
                },
                isAddressFilled: true,
            },
            { new: true, runValidators: false, upsert: true }
        );
        if(!updatedUser){
            throw new ApiError(500,"Error updating address information");
        }
        return res.status(200).json(
            new ApiResponse(200,updatedUser,"address details updated successfully")
        );
    } catch (error) {
        throw new ApiError(500,"Error updating address details");
    }
});

/**
 * @desc add parents information of user
 * @route POST /api/profile/parentsinfo
 * @access Private
 */ 
const addParentsInfo = asyncHandler(async (req, res) => {
    const {isFatherAlive,fatherName,fatherOccupation,isFatherSalaried,isMotherAlive,motherName,motherOccupation,isMotherSalaried} = req.body;

    // Validate user input
    const { errors } = profileValidator.validateParentsDetails(req.body);
    if (errors) {
        return res
            .status(400)
            .json(new ApiResponse(400, errors, "Validation error"));
    }

    try {
        const updatedUser = await Profile.findOneAndUpdate(
            {userId: req.user._id},
            {
                parentsDetails: {
                    isFatherAlive,
                    fatherName,
                    fatherOccupation,
                    isFatherSalaried,
                    isMotherAlive,
                    motherName,
                    motherOccupation,
                    isMotherSalaried
                },
                isParentsDetailsFilled: true,
            },
            { new: true, runValidators: false, upsert: true }
        );
        if(!updatedUser){
            throw new ApiError(500,"Error updating parents information");
        }
        return res.status(200).json(
            new ApiResponse(200,updatedUser,"parents details updated successfully")
        );
    } catch (error) {
        console.log(error);
        throw new ApiError(500,"Error updating parents details");
    }
});

/**
 * @desc add past qualification information of user
 * @route POST /api/profile/pastqualification
 * @access Private
 */ 
const addPastQualification = asyncHandler(async (req, res) => {
    const {
        qualificationLevel,
        stream,
        completed,
        instituteState,
        instituteCity,
        instituteDistrict,
        instituteTaluka,
        instituteName,
        course,
        boardUniversity,
        admissionYear,
        passingYear,
        result,
        percentage,
        attempts,
        wasAnyGaps,
        gapYears,
    } = req.body;

    // Validate user input
    const { errors } = profileValidator.validatePastQualification(req.body);
    if (errors) {
        return res
            .status(400)
            .json(new ApiResponse(400, errors, "Validation error"));
    }

    if (!req.file || !req.file?.path) {
        throw new ApiError(400, "Certificate is required");
    }
    
    const certificateLocalPath = req.file.path;
    const certificate = await uploadOnCloudinary(certificateLocalPath);
    if(!certificate || !certificate.url){
        throw new ApiError(400,"Error uploading certificate to cloudinary");
    }

    try {
        const newQualification = {
            qualificationLevel,
            stream,
            completed,
            instituteState,
            instituteCity,
            instituteDistrict,
            instituteTaluka,
            instituteName,
            course,
            boardUniversity,
            admissionYear,
            passingYear,
            result,
            percentage,
            attempts,
            certificate : certificate?.url,
            wasAnyGaps,
            gapYears: gapYears ?? 0,
        };

        const updatedUser = await Profile.findOneAndUpdate(
            { userId: req.user._id },
            {
                $push: { pastQualifications: newQualification }, 
                isPastQualificationsFilled: true, 
            },
            { new: true, runValidators: false} 
        );

        if (!updatedUser) {
            throw new ApiError(500, "Error updating past qualifications");
        }

        return res.status(200).json(
            new ApiResponse(200, updatedUser, "Past qualification added successfully")
        );
    } catch (error) {
        console.error('Error adding past qualification:', error);
        throw new ApiError(500, `Error adding past qualification: ${error.message}`);
    }
});

/**
 * @desc delete past qualification information of user
 * @route POST /api/profile/currentqualification
 * @access Private
 */ 
const deletePastQualification = asyncHandler(async (req, res) => {
    const { index } = req.params; 

    if (!index || isNaN(index)) {
        throw new ApiError(400, "Invalid index provided");
    }
    try {
        const user = await Profile.findOne({ userId: req.user._id });
        if (!user) {
            throw new ApiError(404, "User profile not found");
        }
        if (index < 0 || index >= user.pastQualifications.length) {
            throw new ApiError(400, "Invalid qualification index");
        }
        user.pastQualifications.splice(index, 1);
        // Update the isPastQualificationsFilled flag if no qualifications remain
        user.isPastQualificationsFilled = user.pastQualifications.length > 0;

        await user.save();
        return res.status(200).json(
            new ApiResponse(200, user, "Past qualification deleted successfully")
        );
    } catch (error) {
        console.error("Error deleting past qualification:", error);
        throw new ApiError(500, `Error deleting qualification: ${error.message}`);
    }
});

/**
 * @desc add current qualification information of user
 * @route POST /api/profile/currentqualification
 * @access Private
 */ 
const addCurrentQualification = asyncHandler(async (req, res) => {
    const {
        qualificationLevel,
        stream,
        instituteState,
        instituteCity,
        instituteDistrict,
        instituteTaluka,
        instituteName,
        admissionYear,
        yearOfStudy,
        mode,
        meritPercentile,
        capId,
        admissionType,
        admissionReservation,
        completed,
        result,
        percentage,
        gapYears
    } = req.body;

    // Validate user input
    const { errors } = profileValidator.validateCurrentQualification(req.body);
    if (errors) {
        return res
            .status(400)
            .json(new ApiResponse(400, errors, "Validation error"));
    }
    if (completed === "Completed") {
        if (!req.file || !req.file?.path) {
            throw new ApiError(400, "Certificate is required");
        }
    }
    let certificate = "";
    if(completed=="Completed"){
        const certificateLocalPath = req.file.path;
        certificate = await uploadOnCloudinary(certificateLocalPath);
        if(!certificate || !certificate.url){
            throw new ApiError(400,"Error uploading certificate to cloudinary");
        }
    }
    try {
        const newQualification = {
            qualificationLevel,
            stream,
            instituteState,
            instituteCity,
            instituteDistrict,
            instituteTaluka,
            instituteName,
            admissionYear,
            yearOfStudy,
            mode,
            meritPercentile,
            capId,
            admissionType,
            admissionReservation,
            completed,
            result: result ?? "",
            certificate: certificate?.url ?? "",
            percentage: percentage ?? "",
            gapYears: gapYears ?? 0,
        };
        
        const updatedUser = await Profile.findOneAndUpdate(
                { userId: req.user._id },
                {
                    $push: { currentQualification: newQualification }, 
                    isCurrentQualificationsFilled: true, 
                },
                { new: true, runValidators: false, upsert: true } 
            );
            if (!updatedUser) {
                throw new ApiError(500, "Error updating current qualifications");
            }
    
            return res.status(200).json(
                new ApiResponse(200, updatedUser, "Current qualification added successfully")
            );
        } catch (error) {
            console.error('Error adding current qualification:', error);
            throw new ApiError(500, `Error adding current qualification: ${error.message}`);
        }
});

/**
 * @desc delete current qualification information of user
 * @route POST /api/profile/currentqualification
 * @access Private
 */ 
const deleteCurrentQualification = asyncHandler(async (req, res) => {
    const { index } = req.params; 

    if (!index || isNaN(index)) {
        throw new ApiError(400, "Invalid index provided");
    }
    try {
        const user = await Profile.findOne({ userId: req.user._id });
        if (!user) {
            throw new ApiError(404, "User profile not found");
        }

        if (index < 0 || index >= user.currentQualification.length) {
            throw new ApiError(400, "Invalid qualification index");
        }
        user.currentQualification.splice(index, 1);
        // Update the isCurrentQualificationsFilled flag if no qualifications remain
        user.isCurrentQualificationsFilled = user.currentQualification.length > 0;

        await user.save();
        return res.status(200).json(
            new ApiResponse(200, user, "Current qualification deleted successfully")
        );
    } catch (error) {
        console.error("Error deleting current qualification:", error);
        throw new ApiError(500, `Error deleting qualification: ${error.message}`);
    }
});

/**
 * @desc add hostel information of user
 * @route POST /api/profile/hostelinfo
 * @access Private
 */
const addHostelInfo = asyncHandler(async (req, res) => {
    const {hostelCategory,hostelFees,hostelType,isMessAvailable,messFees} = req.body;

    // Validate user input
    const { errors } = profileValidator.validateHostelDetails(req.body);
    if (errors) {
        return res
            .status(400)
            .json(new ApiResponse(400, errors, "Validation error"));
    }
    if (hostelCategory === "Hostellier") {
        if (!req.file || !req.file?.path) {
            throw new ApiError(400, "Hostel Certificate is required");
        }
    }
    let certificate = "";
    if(hostelCategory === "Hostellier"){
        const certificateLocalPath = req.file.path;
        certificate = await uploadOnCloudinary(certificateLocalPath);
        if(!certificate || !certificate.url){
            throw new ApiError(400,"Error uploading certificate to cloudinary");
        }
    }

    try {
        const updatedUser = await Profile.findOneAndUpdate(
            {userId: req.user._id},
            {
                hostelDetails: {
                    hostelCategory,
                    hostelFees,
                    hostelType,
                    hostelCertificate: certificate?.url || "",
                    isMessAvailable,
                    messFees
                },
                isHostelDetailsFilled: true,
            },
            { new: true, runValidators: false, upsert: true }
        );
        if(!updatedUser){
            throw new ApiError(500,"Error updating hostel information");
        }
        return res.status(200).json(
            new ApiResponse(200,updatedUser,"hostel details updated successfully")
        );
    } catch (error) {
        throw new ApiError(500,"Error updating hostel details");
    }
});

/**
 * @desc fetch profile of user
 * @route GET /api/v1/profile
 * @access Private
 */
const fetchProfile = asyncHandler(async(req,res) =>{
    let profile = await Profile.findOne({userId:req.user._id});
    if(!profile){
        profile = new Profile();
        profile.userId = req.user._id;
        await profile.save();
    };
    return res.status(200).json(new ApiResponse(200,profile,"Profile fetched successfully"));
});


export { addPersonalInfo, addIncomeInfo, addDomicileInfo, addBankInfo, addAddressInfo, addParentsInfo, addPastQualification, addCurrentQualification, deleteCurrentQualification, deletePastQualification, addHostelInfo, fetchProfile};