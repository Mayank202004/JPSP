import Joi from "joi";

// Profile Info Validator
function validatePersonalDetails(data) {
    const schema = Joi.object({
        fullName: Joi.string().min(3).max(50).regex(/^[a-zA-Z\s]+$/).required()
            .message("Full name must contain only letters and spaces"),
        dob: Joi.date().required().message("Date of birth is required"),
        age: Joi.number().integer().min(0).max(150).required(),
        aadharNumber: Joi.string().length(12).pattern(/^\d+$/).required()
            .message("Aadhar number must be 12 digits"),
        mobile: Joi.string().length(10).pattern(/^\d+$/).required()
            .message("Mobile number must be 10 digits"),
        gender: Joi.string().valid("Male", "Female", "Other").required(),
        parentMobile: Joi.string().length(10).pattern(/^\d+$/).optional(),
        maritalStatus: Joi.string().valid("Single", "Married", "Widowed", "Divorced").optional(),
        religion: Joi.string().optional(),
        casteCategory: Joi.string().optional(),
        email: Joi.string().email().required(),
    });

    const { error, value } = schema.validate(data, { abortEarly: false });

    if (error) {
        return { errors: error.details.reduce((acc, curr) => {
            acc[curr.path[0]] = curr.message;
            return acc;
        }, {}) };
    }

    return { value };
}

// Income Details Validator
function validateIncomeDetails(data) {
    const schema = Joi.object({
        familyIncome: Joi.number().min(0).required(),
        incomeCertificateNumber: Joi.string().required(),
        incomeIssuingAuthority: Joi.string().required(),
        incomeCertificate: Joi.string().uri().optional(),
        incomeCertificateIssuedDate: Joi.date().required(),
    });

    const { error, value } = schema.validate(data, { abortEarly: false });

    if (error) {
        return { errors: error.details.reduce((acc, curr) => {
            acc[curr.path[0]] = curr.message;
            return acc;
        }, {}) };
    }

    return { value };
}

// Domicile Details Validator
function validateDomicileDetails(data) {
    const schema = Joi.object({
        domicileCertificateNumber: Joi.string().required(),
        domicileIssuingAuthority: Joi.string().required(),
        domicileIssuingDate: Joi.date().required(),
        domicileCertificate: Joi.string().uri().optional(),
    });

    const { error, value } = schema.validate(data, { abortEarly: false });

    if (error) {
        return { errors: error.details.reduce((acc, curr) => {
            acc[curr.path[0]] = curr.message;
            return acc;
        }, {}) };
    }

    return { value };
}

// Bank Details Validator
function validateBankDetails(data) {
    const schema = Joi.object({
        accountNumber: Joi.string().pattern(/^\d+$/).required()
            .message("Account number must contain only digits"),
        ifsc: Joi.string().pattern(/^[A-Z]{4}0[A-Z0-9]{6}$/).required()
            .message("Invalid IFSC code"),
        bankName: Joi.string().required(),
        branchName: Joi.string().required(),
    });

    const { error, value } = schema.validate(data, { abortEarly: false });

    if (error) {
        return { errors: error.details.reduce((acc, curr) => {
            acc[curr.path[0]] = curr.message;
            return acc;
        }, {}) };
    }

    return { value };
}

// Address Details Validator
function validateAddressDetails(data) {
    const schema = Joi.object({
        address: Joi.string().required(),
        city: Joi.string().required(),
        taluka: Joi.string().optional(),
        district: Joi.string().required(),
        state: Joi.string().required(),
        pincode: Joi.string().length(6).pattern(/^\d+$/).required()
            .message("Pincode must be 6 digits"),
    });

    const { error, value } = schema.validate(data, { abortEarly: false });

    if (error) {
        return { errors: error.details.reduce((acc, curr) => {
            acc[curr.path[0]] = curr.message;
            return acc;
        }, {}) };
    }

    return { value };
}

// Parents Details Validator
function validateParentsDetails(data) {
    const schema = Joi.object({
        isFatherAlive: Joi.boolean().required(),
        fatherName: Joi.string().when("isFatherAlive", { is: true, then: Joi.required() }),
        fatherOccupation: Joi.string().optional(),
        isFatherSalaried: Joi.boolean().optional(),
        isMotherAlive: Joi.boolean().required(),
        motherName: Joi.string().when("isMotherAlive", { is: true, then: Joi.required() }),
        motherOccupation: Joi.string().optional(),
        isMotherSalaried: Joi.boolean().optional(),
    });

    const { error, value } = schema.validate(data, { abortEarly: false });

    if (error) {
        return { errors: error.details.reduce((acc, curr) => {
            acc[curr.path[0]] = curr.message;
            return acc;
        }, {}) };
    }

    return { value };
}

// Past Qualification Details Validator
function validatePastQualification(data) {
    const schema = Joi.object({
        qualificationLevel: Joi.string().required(),
        stream: Joi.string().required(),
        completed: Joi.boolean().required(),
        instituteState: Joi.string().required(),
        instituteCity: Joi.string().required(),
        instituteDistrict: Joi.string().required(),
        instituteTaluka: Joi.string().optional(),
        instituteName: Joi.string().required(),
        course: Joi.string().required(),
        boardUniversity: Joi.string().required(),
        admissionYear: Joi.date().required(),
        passingYear: Joi.date().required(),
        result: Joi.string().required(),
        percentage: Joi.number().min(0).max(100).required(),
        attempts: Joi.number().min(0).optional(),
        certificate: Joi.string().uri().optional(),
        wasAnyGaps: Joi.boolean().required(),
        gapYears: Joi.number().min(0).optional(),
    });

    const { error, value } = schema.validate(data, { abortEarly: false });

    if (error) {
        return { errors: error.details.reduce((acc, curr) => {
            acc[curr.path[0]] = curr.message;
            return acc;
        }, {}) };
    }

    return { value };
}

// Current Qualification Details Validator
function validateCurrentQualification(data) {
    const schema = Joi.object({
        qualificationLevel: Joi.string().required(),
        stream: Joi.string().required(),
        instituteName: Joi.string().required(),
        admissionYear: Joi.date().required(),
        yearOfStudy: Joi.number().integer().min(1).max(10).required(),
        mode: Joi.string().valid("Regular", "Distance").required(),
        meritPercentile: Joi.number().min(0).max(100).optional(),
        capId: Joi.string().optional(),
        admissionType: Joi.string().required(),
        admissionReservation: Joi.string().optional(),
        result: Joi.string().required(),
        percentage: Joi.number().min(0).max(100).required(),
        certificate: Joi.string().uri().optional(),
        gapYears: Joi.number().min(0).optional(),
    });

    const { error, value } = schema.validate(data, { abortEarly: false });

    if (error) {
        return { errors: error.details.reduce((acc, curr) => {
            acc[curr.path[0]] = curr.message;
            return acc;
        }, {}) };
    }

    return { value };
}

// Hostel Details Validator
function validateHostelDetails(data) {
    const schema = Joi.object({
        hostelCategory: Joi.string().required(),
        hostelFees: Joi.number().min(0).required(),
        hostelCertificate: Joi.string().uri().optional(),
        hostelType: Joi.string().valid("Government", "Private").required(),
        messFees: Joi.number().min(0).optional(),
    });

    const { error, value } = schema.validate(data, { abortEarly: false });

    if (error) {
        return { errors: error.details.reduce((acc, curr) => {
            acc[curr.path[0]] = curr.message;
            return acc;
        }, {}) };
    }

    return { value };
}

export {
    validatePersonalDetails,
    validateIncomeDetails,
    validateDomicileDetails,
    validateBankDetails,
    validateAddressDetails,
    validateParentsDetails,
    validatePastQualification,
    validateCurrentQualification,
    validateHostelDetails,
};
