import Joi from "joi";

// Personal details validator
function validatePersonalDetails(data) {
    const schema = Joi.object({
        fullName: Joi.string()
            .min(3)
            .max(50)
            .regex(/^[a-zA-Z\s'-]+$/) // Allow letters, spaces, hyphens, and apostrophes
            .required()
            .messages({
                "string.base": "Full name must be a string",
                "string.min": "Full name must be at least 3 characters long",
                "string.max": "Full name cannot exceed 50 characters",
                "string.pattern.base": "Full name can only contain letters, spaces, hyphens, and apostrophes",
                "any.required": "Full name is required",
            }),
        dob: Joi.string()
            .pattern(/^\d{2}\/\d{2}\/\d{4}$/) // Validate DD/MM/YYYY format
            .required()
            .messages({
                "string.pattern.base": "Date of birth must be in DD/MM/YYYY format",
                "any.required": "Date of birth is required",
            }),
        age: Joi.number()
            .integer()
            .min(0)
            .max(150)
            .required()
            .messages({
                "number.base": "Age must be a number",
                "number.integer": "Age must be an integer",
                "number.min": "Age cannot be negative",
                "number.max": "Age cannot exceed 150",
                "any.required": "Age is required",
            }),
        aadharNumber: Joi.string()
            .length(12)
            .pattern(/^\d+$/)
            .required()
            .messages({
                "string.base": "Aadhar number must be a string",
                "string.length": "Aadhar number must be exactly 12 digits",
                "string.pattern.base": "Aadhar number can only contain digits",
                "any.required": "Aadhar number is required",
            }),
        mobile: Joi.string()
            .length(10)
            .pattern(/^\d+$/)
            .required()
            .messages({
                "string.base": "Mobile number must be a string",
                "string.length": "Mobile number must be exactly 10 digits",
                "string.pattern.base": "Mobile number can only contain digits",
                "any.required": "Mobile number is required",
            }),
        gender: Joi.string()
            .valid("Male", "Female", "Other")
            .required()
            .messages({
                "string.base": "Gender must be a string",
                "any.only": "Gender must be one of Male, Female, or Other",
                "any.required": "Gender is required",
            }),
        parentMobile: Joi.string()
            .length(10)
            .pattern(/^\d+$/)
            .required()
            .messages({
                "string.base": "Parent mobile number must be a string",
                "string.length": "Parent mobile number must be exactly 10 digits",
                "string.pattern.base": "Parent mobile number can only contain digits",
                "any.required": "Parent Mobile number is required"
            }),
        maritalStatus: Joi.string()
            .valid("Single", "Married", "Widowed", "Divorced")
            .required()
            .messages({
                "string.base": "Marital status must be a string",
                "any.only": "Marital status must be one of Single, Married, Widowed, or Divorced",
                "any.required": "Marital status is required",
            }),
        religion: Joi.string()
            .required()
            .messages({
                "string.base": "Religion must be a string",
                "any.required": "Religion is required",
            }),
        casteCategory: Joi.string()
            .required()
            .messages({
                "string.base": "Caste category must be a string",
                "any.required": "casteCategory is required",
            }),
        email: Joi.string()
            .email()
            .required()
            .messages({
                "string.base": "Email must be a string",
                "string.email": "Email must be a valid email address",
                "any.required": "Email is required",
            }),
    });

    const { error, value } = schema.validate(data, { abortEarly: false });

    if (error) {
        const errors = error.details.reduce((acc, curr) => {
            acc[curr.path[0]] = curr.message;
            return acc;
        }, {});
        return { errors };
    }

    return { value };
}

// Income Details Validator
function validateIncomeDetails(data) {
    const schema = Joi.object({
        familyIncome: Joi.number().min(0).required()
            .messages({
                "number.base": "Family income must be a number",
                "number.min": "Family income cannot be negative",
                "any.required": "Family income is required",
            }),
        incomeCertificateNumber: Joi.string().required()
            .messages({
                "string.base": "Certificate number must be a string",
                "any.required": "Certificate number is required",
            }),
        incomeIssuingAuthority: Joi.string().required()
            .messages({
                "string.base": "Issuing authority must be a string",
                "any.required": "Issuing authority is required",
            }),
        incomeCertificateIssuedDate: Joi.date().required()
            .messages({
                "date.base": "Invalid date format",
                "any.required": "Certificate issued date is required",
            }),
    });

    const { error, value } = schema.validate(data, { abortEarly: false });

    if (error) {
        // Simplify error handling
        const errors = error.details.reduce((acc, curr) => {
            acc[curr.path[0]] = curr.message;
            return acc;
        }, {});
        return { errors };
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
