import { asyncHandler } from '../utils/asyncHandler.js';
import { ApiError } from '../utils/ApiError.js';
import { User } from "../models/user.model.js";
import { ApiResponse } from "../utils/ApiResponse.js";
import { validateRegisterInput } from "../validators/user.validator.js";


const registerUser =asyncHandler(async (req, res) => {
    const {fullName,email,username,password} = req.body;

    if (
        [fullName, email, username, password].some((field) => field?.trim() === "")
    ) {
        throw new ApiError(400, "All fields are required");
    }
    // Validate user input
    const { errors } = validateRegisterInput(req.body);
    if (errors) {
        // Send structured error response
        return res.status(400).json(
            new ApiResponse(400, errors,"Validation error")
        );
    }

    // Check if user already exists
    const existingUser = await User.findOne({
        $or: [{ email }, { username }],
    })
    if(existingUser){
        throw new ApiError(400, "Username or email already exists");
    }

    // Create new user
    const user = await User.create({
        fullName,
        email,
        username,
        password,
    })
    const createdUser= await User.findById(user._id)
    .select("-password -role -refreshToken -avatar");

    if(!createdUser){
        throw new ApiError(500, "Error creating user");
    }

    return res.status(201).json(
        new ApiResponse(201,createdUser,"User created successfully")
    )

})

export {
    registerUser,
}