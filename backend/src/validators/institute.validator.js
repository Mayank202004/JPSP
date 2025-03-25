import Joi from "joi";

function validateInstituteInput(data) {
    const schema = Joi.object({
        name: Joi.string()
            .min(3)
            .max(100)
            .required()
            .messages({
                "string.empty": "Institute name is required",
                "string.min": "Institute name must be at least 3 characters",
                "string.max": "Institute name cannot exceed 100 characters"
            }),
        address: Joi.string()
            .min(5)
            .max(255)
            .required()
            .messages({
                "string.empty": "Address is required",
                "string.min": "Address must be at least 5 characters",
                "string.max": "Address cannot exceed 255 characters"
            }),
        city: Joi.string()
            .min(2)
            .max(50)
            .required()
            .messages({
                "string.empty": "City is required",
                "string.min": "City name must be at least 2 characters",
                "string.max": "City name cannot exceed 50 characters"
            }),
        state: Joi.string()
            .min(2)
            .max(50)
            .required()
            .messages({
                "string.empty": "State is required",
                "string.min": "State name must be at least 2 characters",
                "string.max": "State name cannot exceed 50 characters"
            }),
        country: Joi.string()
            .min(2)
            .max(50)
            .required()
            .messages({
                "string.empty": "Country is required",
                "string.min": "Country name must be at least 2 characters",
                "string.max": "Country name cannot exceed 50 characters"
            }),
        postalCode: Joi.string()
            .pattern(/^[0-9]{5,10}$/)
            .required()
            .messages({
                "string.empty": "Postal code is required",
                "string.pattern.base": "Postal code must be between 5-10 digits"
            }),
        contactEmail: Joi.string()
            .email()
            .required()
            .messages({
                "string.empty": "Contact email is required",
                "string.email": "Please enter a valid email address"
            }),
        contactPhone: Joi.string()
            .pattern(/^[0-9]{10,15}$/)
            .required()
            .messages({
                "string.empty": "Contact phone number is required",
                "string.pattern.base": "Phone number must be between 10-15 digits"
            })
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

export { validateInstituteInput };