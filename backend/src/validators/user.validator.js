import Joi from "joi";

function validateRegisterInput(data) {
    const schema = Joi.object({
        fullName: Joi.string()
            .min(3)
            .max(50)
            .regex(/^[a-zA-Z\s]+$/)
            .message("Full name must contain only letters and spaces")
            .required(),
        email: Joi.string()
            .email()
            .message("Please enter a valid email address")
            .required(),
        username: Joi.string()
            .alphanum()
            .min(3)
            .max(20)
            .message("Username must be 3-20 characters long and alphanumeric")
            .required(),
        password: Joi.string()
            .min(8)
            .max(50)
            .regex(
                /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/
            )
            .message(
                "Password must be at least 8 characters, contain one letter, one number, and one special character"
            )
            .required(),
    });

    const { error, value } = schema.validate(data, { abortEarly: false });

    if (error) {
        const errors = error.details.reduce((acc, curr) => {
            acc[curr.path[0]] = curr.message; // Map each field to its error message
            return acc;
        }, {});
        return { errors };
    }

    return { value };
}

function validateUpdateUserInput(data) {
    const schema = Joi.object({
        fullName: Joi.string()
            .min(3)
            .max(50)
            .regex(/^[a-zA-Z\s]+$/)
            .message("Full name must contain only letters and spaces"),
        username: Joi.string()
            .alphanum()
            .min(3)
            .max(20)
            .message("Username must be 3-20 characters long and alphanumeric"),
    }).or("fullName", "username"); // Require at least one of the fields

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

export { validateRegisterInput, validateUpdateUserInput };
