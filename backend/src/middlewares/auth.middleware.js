import { asyncHandler } from "../utils/asyncHandler.js";
import jwt from "jsonwebtoken";
import { User } from "../models/user.model.js";
import { ApiError } from "../utils/ApiError.js";

/**
 * @desc Verify JWT token
 * @access Private (User)
 */
export const verifyJWT = asyncHandler(async (req, _, next) => {
    try {
        // Get token from cookies or headers
        const token =
            req.cookies.accessToken ||
            req.header("Authorization")?.replace("Bearer ", "");
        if (!token) {
            throw new ApiError(401, "Unauthorized Request No Token Found");
        }
        // Decode token
        const decodedToken = jwt.verify(token, process.env.ACCESS_TOKEN_SECRET);
        // Find user based on token id
        const user = await User.findById(decodedToken._id).select(
            "-password -refreshToken"
        );
        if (!user) {
            throw new ApiError(401, "Invalid Access Token");
        }
        req.user = user; // Attach user to request object
        next();
    } catch (error) {
        throw new ApiError(401, error?.message || "Unauthorized Request");
    }
});

// Should be followed by verifyJWT
/**
 * @desc Verify if user is an admin
 * @access Private (User -> Role == Admin only)
 */
export const verifyAdmin = asyncHandler(async (req, _, next) => {
    if (req.user.role == "user") {
        throw new ApiError(403, "Forbidden Access");
    }
    next();
});

export const verifySuperAdmin = asyncHandler(async (req, _, next) => {
    if (req.user.role !== "superadmin") {
        throw new ApiError(403, "Forbidden Access");
    }
    next();
});

export const verifyStudent = asyncHandler(async (req, _, next) => {
    if (req.user.role !== "user") {
        throw new ApiError(403, "You are not a student");
    }
    next();
});
