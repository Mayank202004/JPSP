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
            .valid("Unmarried", "Married", "Widowed", "Divorced")
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
        domicileCertificateNumber: Joi.string().required()
            .messages({
                "string.base": "Domicile certificate number must be a string",
                "any.required": "Domicile certificate number is required",
            }),
        domicileIssuingAuthority: Joi.string().required()
            .messages({
                "string.base": "Issuing authority must be a string",
                "any.required": "Issuing authority is required",
            }),
        domicileIssuingDate: Joi.date().required()
            .messages({
                "date.base": "Invalid date format",
                "any.required": "Domicile issuing date is required",
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

// Bank Details Validator
function validateBankDetails(data) {
    const schema = Joi.object({
        accountNumber: Joi.string().pattern(/^\d+$/).required()
            .messages({
                "string.base": "Account number must be a string",
                "string.pattern.base": "Account number must contain only digits",
                "any.required": "Account number is required",
            }),
        ifsc: Joi.string().pattern(/^[A-Z]{4}0[A-Z0-9]{6}$/).required()
            .messages({
                "string.base": "IFSC code must be a string",
                "string.pattern.base": "Invalid IFSC code format",
                "any.required": "IFSC code is required",
            }),
        bankName: Joi.string().required()
            .messages({
                "string.base": "Bank name must be a string",
                "any.required": "Bank name is required",
            }),
        branchName: Joi.string().required()
            .messages({
                "string.base": "Branch name must be a string",
                "any.required": "Branch name is required",
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

// Address Details Validator
function validateAddressDetails(data) {
    const schema = Joi.object({
        address: Joi.string().required()
            .messages({
                "string.base": "Address must be a string",
                "any.required": "Address is required",
            }),
        city: Joi.string().required()
            .messages({
                "string.base": "City must be a string",
                "any.required": "City is required",
            }),
        taluka: Joi.string().optional()
            .messages({
                "string.base": "Taluka must be a string",
            }),
        district: Joi.string().required()
            .messages({
                "string.base": "District must be a string",
                "any.required": "District is required",
            }),
        state: Joi.string().required()
            .messages({
                "string.base": "State must be a string",
                "any.required": "State is required",
            }),
        pincode: Joi.string().length(6).pattern(/^\d+$/).required()
            .messages({
                "string.base": "Pincode must be a string",
                "string.length": "Pincode must be exactly 6 digits",
                "string.pattern.base": "Pincode must contain only digits",
                "any.required": "Pincode is required",
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
// Parents Details Validator
function validateParentsDetails(data) {
    const schema = Joi.object({
        isFatherAlive: Joi.boolean().required()
            .messages({
                "boolean.base": "isFatherAlive must be a boolean",
                "any.required": "isFatherAlive is required",
            }),
        fatherName: Joi.string().when("isFatherAlive", {
            is: true,
            then: Joi.required().messages({
                "string.base": "Father's name must be a string",
                "any.required": "Father's name is required",
            }),
            otherwise: Joi.optional(),
        }),
        fatherOccupation: Joi.string().when("isFatherAlive", {
            is: true,
            then: Joi.required().messages({
                "string.base": "Father's occupation must be a string",
                "any.required": "Father's occupation is required",
            }),
            otherwise: Joi.optional(),
        }),
        isFatherSalaried: Joi.boolean().when("isFatherAlive", {
            is: true,
            then: Joi.required().messages({
                "boolean.base": "isFatherSalaried must be a boolean",
                "any.required": "isFatherSalaried is required",
            }),
            otherwise: Joi.optional(),
        }),
        isMotherAlive: Joi.boolean().required()
            .messages({
                "boolean.base": "isMotherAlive must be a boolean",
                "any.required": "isMotherAlive is required",
            }),
        motherName: Joi.string().when("isMotherAlive", {
            is: true,
            then: Joi.required().messages({
                "string.base": "Mother's name must be a string",
                "any.required": "Mother's name is required",
            }),
            otherwise: Joi.optional(),
        }),
        motherOccupation: Joi.string().when("isMotherAlive", {
            is: true,
            then: Joi.required().messages({
                "string.base": "Mother's occupation must be a string",
                "any.required": "Mother's occupation is required",
            }),
            otherwise: Joi.optional(),
        }),
        isMotherSalaried: Joi.boolean().when("isMotherAlive", {
            is: true,
            then: Joi.required().messages({
                "boolean.base": "isMotherSalaried must be a boolean",
                "any.required": "isMotherSalaried is required",
            }),
            otherwise: Joi.optional(),
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

// Past Qualification Validator
function validatePastQualification(data) {
    const schema = Joi.object({
        qualificationLevel: Joi.string().required().messages({
            "string.base": "Qualification Level must be a string",
            "any.required": "Qualification Level is required",
        }),
        stream: Joi.string().required().messages({
            "string.base": "Stream must be a string",
            "any.required": "Stream is required",
        }),
        completed: Joi.string().valid("Completed", "Pursuing").required().messages({
            "string.base": "Completed must be a string",
            "any.only": 'Completed must be either "Completed" or "Pursuing"',
            "any.required": "Completion status is required",
        }),
        instituteState: Joi.string().required().messages({
            "string.base": "Institute State must be a string",
            "any.required": "Institute State is required",
        }),
        instituteCity: Joi.string().required().messages({
            "string.base": "Institute City must be a string",
            "any.required": "Institute City is required",
        }),
        instituteDistrict: Joi.string().required().messages({
            "string.base": "Institute District must be a string",
            "any.required": "Institute District is required",
        }),
        instituteTaluka: Joi.string().required().messages({
            "string.base": "Institute Taluka must be a string",
            "any.required": "Institute Taluka is required",
        }),
        instituteName: Joi.string().required().messages({
            "string.base": "Institute Name must be a string",
            "any.required": "Institute Name is required",
        }),
        course: Joi.string().required().messages({
            "string.base": "Course must be a string",
            "any.required": "Course is required",
        }),
        boardUniversity: Joi.string().required().messages({
            "string.base": "Board/University must be a string",
            "any.required": "Board/University is required",
        }),
        admissionYear: Joi.number().integer().min(1900).max(new Date().getFullYear()).required().messages({
            "number.base": "Admission Year must be a number",
            "number.integer": "Admission Year must be an integer",
            "number.min": "Admission Year must be after 1900",
            "number.max": `Admission Year cannot be after ${new Date().getFullYear()}`,
            "any.required": "Admission Year is required",
        }),
        passingYear: Joi.number().integer().min(1900).max(new Date().getFullYear()).required().messages({
            "number.base": "Passing Year must be a number",
            "number.integer": "Passing Year must be an integer",
            "number.min": "Passing Year must be after 1900",
            "number.max": `Passing Year cannot be after ${new Date().getFullYear()}`,
            "any.required": "Passing Year is required",
        }),
        result: Joi.string().required().messages({
            "string.base": "Result must be a string",
            "any.required": "Result is required",
        }),
        percentage: Joi.number().min(0).max(100).required().messages({
            "number.base": "Percentage must be a number",
            "number.min": "Percentage cannot be less than 0",
            "number.max": "Percentage cannot be more than 100",
            "any.required": "Percentage is required",
        }),
        attempts: Joi.number().integer().min(1).required().messages({
            "number.base": "Attempts must be a number",
            "number.integer": "Attempts must be an integer",
            "number.min": "Attempts must be at least 1",
            "any.required": "Attempts are required",
        }),
        wasAnyGaps: Joi.boolean().required().messages({
            "boolean.base": "WasAnyGaps must be a boolean",
            "any.required": "WasAnyGaps is required",
        }),
        gapYears: Joi.number().integer().min(0).when('wasAnyGaps', {
            is: true,
            then: Joi.required().messages({
                "number.base": "Gap Years must be a number",
                "number.integer": "Gap Years must be an integer",
                "number.min": "Gap Years cannot be negative",
                "any.required": "Gap Years are required when WasAnyGaps is true",
            }),
            otherwise: Joi.optional(),
        }),
    });
    const { error, value } = schema.validate(data, { abortEarly: false });
    if (error) {
        return {
            errors: error.details.reduce((acc, curr) => {
                acc[curr.path[0]] = curr.message;
                return acc;
            }, {}),
        };
    }
    return { value };
}


// Current Qualification Details Validator
function validateCurrentQualification(data) {
    const schema = Joi.object({
        qualificationLevel: Joi.string().required().messages({
            "string.base": "Qualification Level must be a string",
            "any.required": "Qualification Level is required",
        }),
        stream: Joi.string().required().messages({
            "string.base": "Stream must be a string",
            "any.required": "Stream is required",
        }),
        instituteState: Joi.string().required().messages({
            "string.base": "Institute State must be a string",
            "any.required": "Institute State is required",
        }),
        instituteCity: Joi.string().required().messages({
            "string.base": "Institute City must be a string",
            "any.required": "Institute City is required",
        }),
        instituteDistrict: Joi.string().required().messages({
            "string.base": "Institute District must be a string",
            "any.required": "Institute District is required",
        }),
        instituteTaluka: Joi.string().required().messages({
            "string.base": "Institute Taluka must be a string",
            "any.required": "Institute Taluka is required",
        }),
        instituteName: Joi.string().required().messages({
            "string.base": "Institute Name must be a string",
            "any.required": "Institute Name is required",
        }),
        admissionYear: Joi.date().required().messages({
            "date.base": "Admission Year must be a valid date",
            "any.required": "Admission Year is required",
        }),
        yearOfStudy: Joi.number().integer().min(1).required().messages({
            "number.base": "Year of Study must be a number",
            "number.integer": "Year of Study must be an integer",
            "number.min": "Year of Study must be at least 1",
            "any.required": "Year of Study is required",
        }),
        mode: Joi.string().required().messages({
            "string.base": "Mode must be a string",
            "any.required": "Mode is required",
        }),
        meritPercentile: Joi.number().min(0).max(100).required().messages({
            "number.base": "Merit Percentile must be a number",
            "number.min": "Merit Percentile cannot be less than 0",
            "number.max": "Merit Percentile cannot be more than 100",
            "any.required": "Merit Percentile is required",
        }),
        capId: Joi.string().required().messages({
            "string.base": "CAP ID must be a string",
            "any.required": "CAP ID is required",
        }),
        admissionType: Joi.string().required().messages({
            "string.base": "Admission Type must be a string",
            "any.required": "Admission Type is required",
        }),
        admissionReservation: Joi.string().required().messages({
            "string.base": "Admission Reservation must be a string",
            "any.required": "Admission Reservation is required",
        }),
        completed: Joi.string().valid("Completed", "Pursuing").required().messages({
            "string.base": "Completed must be a string",
            "any.only": 'Completed must be either "Completed" or "Pursuing"',
            "any.required": "Completion status is required",
        }),
        result: Joi.string().when('completed', {
            is: "Completed",
            then: Joi.required().messages({
                "string.base": "Result must be a string",
                "any.required": "Result is required when Completed is 'Completed'",
            }),
            otherwise: Joi.optional(),
        }),
        percentage: Joi.number().min(0).max(100).when('completed', {
            is: "Completed",
            then: Joi.required().messages({
                "number.base": "Percentage must be a number",
                "number.min": "Percentage cannot be less than 0",
                "number.max": "Percentage cannot be more than 100",
                "any.required": "Percentage is required when Completed is 'Completed'",
            }),
            otherwise: Joi.optional(),
        }),
        gapYears: Joi.number().integer().min(0).messages({
            "number.base": "Gap Years must be a number",
            "number.integer": "Gap Years must be an integer",
            "number.min": "Gap Years cannot be negative",
        }),
    });

    const { error, value } = schema.validate(data, { abortEarly: false });

    if (error) {
        return {
            errors: error.details.reduce((acc, curr) => {
                acc[curr.path[0]] = curr.message;
                return acc;
            }, {}),
        };
    }

    return { value };
}

// Hostel Details Validator
function validateHostelDetails(data) {
    const schema = Joi.object({
        hostelCategory: Joi.string()
            .required()
            .valid("Day Scholar", "Hostellier") 
            .messages({
                'string.base': 'Hostel category must be a string',
                'string.empty': 'Hostel category cannot be empty',
                'any.only': 'Hostel category must be one of "Day Scholar", or "Hostellier"',
                'any.required': 'Hostel category is required',
            }),
        hostelFees: Joi.number()
            .min(0)
            .max(10000) 
            .when('hostelCategory', {
                is: Joi.not("Day Scholar"), // Hostel fees is required if not "Day Scholar"
                then: Joi.required(),
                otherwise: Joi.optional(),
            })
            .messages({
                'number.base': 'Hostel fees must be a number',
                'number.min': 'Hostel fees cannot be negative',
                'number.max': 'Hostel fees cannot exceed 1,000,000',
                'any.required': 'Hostel fees is required for non-Day Scholar categories',
            }),
        hostelType: Joi.string()
            .valid("Government", "Private","Rented Room")
            .when('hostelCategory', {
                is: Joi.not("Day Scholar"), // Hostel fees is required if not "Day Scholar"
                then: Joi.required(),
                otherwise: Joi.optional(),
            })
            .messages({
                'string.base': 'Hostel type must be a string',
                'any.only': 'Hostel type must be either "Government", "Private", or "Rented Room"',
                'any.required': 'Hostel type is required',
            }),
        messFees: Joi.number()
            .min(0)
            .max(10000) 
            .when('hostelCategory', {
                is: "Day Scholar", // Mess fees is optional for "Day Scholar"
                then: Joi.optional(),
                otherwise: Joi.required(),
            })
            .messages({
                'number.base': 'Mess fees must be a number',
                'number.min': 'Mess fees cannot be negative',
                'number.max': 'Mess fees cannot exceed 50,000',
                'any.required': 'Mess fees is required for non-Day Scholar categories',
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
