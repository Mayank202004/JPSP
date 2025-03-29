import { asyncHandler } from "../utils/asyncHandler.js";
import { ApiError } from "../utils/ApiError.js";
import { User } from "../models/user.model.js";
import { ApiResponse } from "../utils/ApiResponse.js";
import { validateRegisterInput, validateUpdateUserInput} from "../validators/user.validator.js";
import jwt from "jsonwebtoken";
import { uploadOnCloudinary } from "../utils/cloudinary.js";

/**
 * @desc   Generate access and refresh tokens
 * @route  POST /api/v1/auth/refresh-token
 * @access Public
 */ 
const generateAccessAndRefereshTokens = async (userId) => {
    try {
        const user = await User.findById(userId);
        const accessToken = user.generateAccessToken();
        const refreshToken = user.generateRefreshToken();

        user.refreshToken = refreshToken;
        await user.save({ validateBeforeSave: false });

        return { accessToken, refreshToken };
    } catch (error) {
        throw new ApiError(
            500,
            "Something went wrong while generating referesh and access token"
        );
    }
};

/**
 * @desc   Register a new user
 * @route  POST /api/v1/auth/register
 * @access Public
 */ 
const registerUser = asyncHandler(async (req, res) => {
    const { fullName, email, username, password, role } = req.body;

    if (
        [fullName, email, username, password].some(
            (field) => field?.trim() === ""
        )
    ) {
        throw new ApiError(400, "All fields are required");
    }

    // Validate user input
    const { errors } = validateRegisterInput({fullName, email, username, password});
    if (errors) {
        return res
            .status(400)
            .json(new ApiResponse(400, errors, "Validation error"));
    }

    // Check if user already exists
    const existingUser = await User.findOne({
        $or: [{ email }, { username }],
    });
    if (existingUser) {
        throw new ApiError(400, "Username or email already exists");
    }

    // Default role to "user" if not provided
    const userRole = role || "user"; 

    // Create new user
    const user = await User.create({
        fullName,
        email,
        username,
        password,
        role: userRole,
    });

    const createdUser = await User.findById(user._id).select(
        "-password -refreshToken -avatar"
    );

    if (!createdUser) {
        throw new ApiError(500, "Error creating user");
    }

    return res
        .status(201)
        .json(new ApiResponse(201, createdUser, "User created successfully"));
});



/**
 * @desc   Login user
 * @route  POST /api/v1/auth/login
 * @access Public
 */
const loginUser = asyncHandler(async (req, res) => {
    const { email, username, password } = req.body;

    if (!email && !username) {
        throw new ApiError(400, "Email or username is required");
    }
    if (!password) {
        throw new ApiError(400, "Password is required");
    }

    const user = await User.findOne({
        $or: [{ email }, { username }],
    });

    if (!user) {
        throw new ApiError(404, "Invalid Credentials");
    }

    const isPasswordValid = await user.verifyPassword(password);
    if (!isPasswordValid) {
        throw new ApiError(404, "Invalid Credentials");
    }

    const { accessToken, refreshToken } = await generateAccessAndRefereshTokens(
        user._id
    );

    const loggedInUser = await User.findById(user._id).select(
        "-password -refreshToken"
    );

    //Options for cookies
    const options = {
        httpOnly: true,
        secure: true,
    };

    return res
        .status(200)
        .cookie("accessToken", accessToken, options)
        .cookie("refreshToken", refreshToken, options)
        .json(
            new ApiResponse(
                200,
                {
                    user: loggedInUser,
                    accessToken,
                    refreshToken,
                },
                "User logged In Successfully"
            )
        );
});

/**
 * @desc   Logout user
 * @route  POST /api/v1/auth/logout
 * @access Private (User)
 */ 
const logoutUser = asyncHandler(async (req, res) => {
    await User.findByIdAndUpdate(req.user._id, {
        $unset: {
            refreshToken: 1, // this removes the field from document
        },
    });

    const options = {
        httpOnly: true,
        secure: true,
    };
    return res
        .status(200)
        .clearCookie("accessToken", options)
        .clearCookie("refreshToken", options)
        .json(new ApiResponse(200, {}, "User logged Out"));
});

/**
 * @desc   Refresh access token
 * @route  POST /api/v1/auth/refresh-token
 * @access Public
 */ 
const refreshAccessToken = asyncHandler(async (req,res) =>{
    const incommingRefreshToken = req.cookies.refreshToken || req.body.refreshToken
    if(!incommingRefreshToken){
        throw new ApiError(401,"Unauthorized Request");
    }
    try {
        const decodedToken = jwt.verify(incommingRefreshToken,process.env.REFRESH_TOKEN_SECRET);
        
        const user = await User.findById(decodedToken?._id).select(
            "-password -role -avatar"
        );

        if(!user){
            throw new ApiError(401,"Invalid Refresh Token");
        }
        if(incommingRefreshToken != user?.refreshToken){
            throw new ApiError(401,"Refresh token is expired or used");
        }

        const {accessToken, newRefreshToken} = await generateAccessAndRefereshTokens(user._id)
        // Update refresh token in database
        user.refreshToken = newRefreshToken;
        await user.save({ validateBeforeSave: false });
        
        const options = {
            httpOnly: true,
            secure: true
        }
        return res
        .status(200)
        .cookie("accessToken", accessToken, options)
        .cookie("refreshToken", newRefreshToken, options)
        .json(
            new ApiResponse(
                200, 
                {accessToken, refreshToken: newRefreshToken},
                "Access token refreshed"
            )
        )
    } catch (error) {
        throw new ApiError(401, error?.message || "Invalid refresh token")
    }

});

/** 
 * @desc   Change user password
 * @route  POST /api/v1/auth/change-password
 * @access Private (User)
 */ 
const changeUserPassword = asyncHandler(async (req,res) =>{
    const {oldPassword, newPassword} = req.body;
    if(!oldPassword || !newPassword){
        throw new ApiError(400,"Old password and new password is required");
    }
    const user = await User.findById(req.user?._id);
    
    const isPasswordValid = await user.verifyPassword(oldPassword);
    if(!isPasswordValid){
        throw new ApiError(400,"Old password is incorrect");
    }
    user.password = newPassword;
    await user.save({ validateBeforeSave: false });

    return res
    .status(200)
    .json(new ApiResponse(200,{}, "Password changed successfully"));
});

/**
 * @desc   Get current user
 * @route  GET /api/v1/auth/me
 * @access Private (User)
 */
const getCurrentUser = asyncHandler(async(req, res) => {
    return res
    .status(200)
    .json(new ApiResponse(
        200,
        req.user,
        "User fetched successfully"
    ))
});

/**
 * @desc   Update user details
 * @route  PUT /api/v1/auth/update
 * @access Private (User)
 */ 
const updateUser = asyncHandler(async(req,res) => {
    // Validate user input
    const { errors } = validateUpdateUserInput(req.body);
    if (errors) {
        return res
            .status(400)
            .json(new ApiResponse(400, errors, "Validation error"));
    }
    
    const {username , fullName} = req.body;

    if(!username && !fullName){
        throw new ApiError(400, "Username or Fullname is required");
    }


     // Check if username already exists (excluding the current user)
     if (username) {
        const existingUser = await User.findOne({ username });
        if (existingUser && existingUser._id.toString() !== req.user._id.toString()) {
          throw new ApiError(400, "Username already exists");
        }
    }
    const user = await User.findByIdAndUpdate(
        req.user._id, 
        {
            $set: {username, fullName}
        },
        {new: true, runValidators: true }).select("-password -refreshToken");

    if(!user){
        throw new ApiError(500, "User not found");
    }

    return res
    .status(200)
    .json(new ApiResponse(200, user, "Account details updated successfully"))
});

/**
 * @desc   Update user avatar
 * @route  PUT /api/v1/auth/update-avatar
 * @access Private (User)
 */ 
const updateUserAvatar = asyncHandler(async(req,res) => {
    if (!req.file || !req.file.path) {
        throw new ApiError(400, "Avatar file is missing");
    }
    const avatarLocalPath = req.file.path;
    const avatar = await uploadOnCloudinary(avatarLocalPath);

    if (!avatar.url) {
        throw new ApiError(500, "Error while uploading avatar");
    }

    const user = await User.findByIdAndUpdate(
        req.user?._id,
        {
            $set:{
                avatar: avatar.url
            }
        },
        {new: true}
    ).select("-password -refreshToken")

    if(!user){
        throw new ApiError(500, "User not found");
    }

    return res
    .status(200)
    .json(
        new ApiResponse(200, user, "Avatar image updated successfully")
    )

    
});


export { registerUser, loginUser, logoutUser, refreshAccessToken, changeUserPassword, getCurrentUser, updateUser, updateUserAvatar };
