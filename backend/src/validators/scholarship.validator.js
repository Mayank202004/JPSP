import Joi from 'joi';

function validateScholarshipDetails(data) {
    const schema = Joi.object({
        title: Joi.string()
            .min(5)
            .max(100)
            .trim()
            .required()
            .messages({
                "string.base": "Title must be a string",
                "string.min": "Title must be at least 5 characters long",
                "string.max": "Title cannot exceed 100 characters",
                "any.required": "Title is required",
            }),

        description: Joi.string()
            .min(20)
            .max(5000)
            .trim()
            .required()
            .messages({
                "string.base": "Description must be a string",
                "string.min": "Description must be at least 20 characters long",
                "string.max": "Description cannot exceed 5000 characters",
                "any.required": "Description is required",
            }),

        scholarshipType: Joi.string()
            .valid("Tuition Fee Waiver", "Maintenance Allowance", "Both")
            .required()
            .messages({
                "any.only": "Scholarship type must be one of Tuition Fee Waiver, Maintenance Allowance, or Both",
                "any.required": "Scholarship type is required",
            }),

        deadline: Joi.date()
            .greater("now")
            .required()
            .messages({
                "date.base": "Deadline must be a valid date",
                "date.greater": "Deadline must be a future date",
                "any.required": "Deadline is required",
            }),

        eligibility: Joi.object({
            casteCategory: Joi.string()
                .valid("SC", "ST", "OBC", "VJNT", "EWS", "OPEN")
                .required()
                .messages({
                    "any.only": "Caste category must be one of SC, ST, OBC, VJNT, EWS, or OPEN",
                    "any.required": "Caste category is required",
                }),
            incomeLimit: Joi.number()
                .min(0)
                .required()
                .messages({
                    "number.base": "Income limit must be a number",
                    "number.min": "Income limit cannot be negative",
                    "any.required": "Income limit is required",
                }),
            academicCriteria: Joi.object({
                minPercentage: Joi.number()
                    .min(0)
                    .max(100)
                    .default(50)
                    .messages({
                        "number.base": "Minimum percentage must be a number",
                        "number.min": "Minimum percentage cannot be less than 0",
                        "number.max": "Minimum percentage cannot be more than 100",
                    }),
                applicableCourses: Joi.array()
                    .items(Joi.string())
                    .default([])
                    .messages({
                        "array.base": "Applicable courses must be an array of strings",
                    }),
            }),
        }),

        provider: Joi.object({
            name: Joi.string()
                .min(3)
                .max(100)
                .required()
                .messages({
                    "string.base": "Provider name must be a string",
                    "string.min": "Provider name must be at least 3 characters long",
                    "string.max": "Provider name cannot exceed 100 characters",
                    "any.required": "Provider name is required",
                }),
            department: Joi.string()
                .min(3)
                .max(100)
                .required()
                .messages({
                    "string.base": "Department name must be a string",
                    "string.min": "Department name must be at least 3 characters long",
                    "string.max": "Department name cannot exceed 100 characters",
                    "any.required": "Department name is required",
                }),
        }),

        documentsRequired: Joi.array()
            .items(Joi.string())
            .default([])
            .messages({
                "array.base": "Documents required must be an array of strings",
            }),

        contact: Joi.object({
            email: Joi.string()
                .email()
                .required()
                .messages({
                    "string.email": "Email must be a valid email address",
                    "any.required": "Contact email is required",
                }),
            phone: Joi.string()
                .length(10)
                .pattern(/^\d+$/)
                .required()
                .messages({
                    "string.length": "Phone number must be exactly 10 digits",
                    "string.pattern.base": "Phone number can only contain digits",
                    "any.required": "Contact phone number is required",
                }),
        }),

        status: Joi.string()
            .valid("Open", "Closed", "Upcoming")
            .default("Open")
            .messages({
                "any.only": "Status must be one of Open, Closed, or Upcoming",
            }),
    });

    // Perform validation
    const { error, value } = schema.validate(data, { abortEarly: false });

    if (error) {
        const errors = error.details.reduce((acc, curr) => {
            acc[curr.path.join(".")] = curr.message;
            return acc;
        }, {});
        return { errors };
    }

    return { value };
}

export default validateScholarshipDetails;
