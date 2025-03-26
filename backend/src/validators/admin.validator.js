import Joi from "joi";

function validateAdminInput(data) {
    const schema = Joi.object({
        userId: Joi.string().regex(/^[0-9a-fA-F]{24}$/).required().messages({
            "string.pattern.base": "Invalid user ID format",
            "any.required": "User ID is required",
        }),
        position: Joi.string()
            .valid("Desk 1 Officer", "Desk 2 Officer", "DDO")
            .required()
            .messages({
                "any.only": "Position must be 'Desk 1 Officer', 'Desk 2 Officer', or 'DDO'",
                "any.required": "Position is required",
            }),
        instituteId: Joi.string()
            .regex(/^[0-9a-fA-F]{24}$/)
            .when("position", {
                is: "Desk 1 Officer",
                then: Joi.required(),
                otherwise: Joi.forbidden(),
            })
            .messages({
                "any.required": "Institute ID is required for Desk 1 Officer",
                "string.pattern.base": "Invalid institute ID format",
            }),
        scholarshipId: Joi.string()
            .regex(/^[0-9a-fA-F]{24}$/)
            .when("position", {
                is: Joi.valid("Desk 2 Officer", "DDO"),
                then: Joi.required(),
                otherwise: Joi.forbidden(),
            })
            .messages({
                "any.required": "Scholarship ID is required for Desk 2 Officer or DDO",
                "string.pattern.base": "Invalid scholarship ID format",
            }),
        verified: Joi.boolean().default(false),
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

export { validateAdminInput };
