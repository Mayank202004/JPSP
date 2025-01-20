import mongoose, { Schema } from 'mongoose';
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken'
import { ApiError } from '../utils/ApiError.js';

const userSchema = new Schema(
    {
        username: {
            type: String,
            required: true,
            unique: true,
            minlength: 3,
            maxlength: 20,
            lowercase: true,
            trim: true,
            index: true,
        },
        email: {
            type: String,
            required: true,
            unique: true,
            lowercase: true,
            trim: true,
        },
        password: {
            type: String,
            required: [true, 'Password is required']
        },
        role: {
            type: String,
            enum: ['user', 'admin'],
            default: 'user',
        },
        fullName: {
            type: String,
            required: true,
            trim: true, 
            index: true
        },
        avatar: {
            type: String, 
        },
        refreshToken: {
            type: String,
        }
    },
    { timestamps: true }
)

// Pre-save hook for password hashing
userSchema.pre('save', async function (next) {
    try {
        if (this.isModified('password')) {
            this.password = await bcrypt.hash(this.password, 10);
        }
        next();
    } catch (error) {
        next(new ApiError(500, 'Error hashing password'));
    }
});

// Password verification method
userSchema.methods.verifyPassword = async function (password) {
    try {
        return await bcrypt.compare(password, this.password);
    } catch (error) {
        throw new ApiError(500, 'Error verifying password');
    }
}

// Generate access token method
userSchema.methods.generateAccessToken = function () {
    try {
        return jwt.sign(
            {
                _id: this._id,
                email: this.email,
                username: this.username,
                fullName: this.fullName
            },
            process.env.ACCESS_TOKEN_SECRET,
            {
                expiresIn: process.env.ACCESS_TOKEN_EXPIRY || '1h' // Default expiry
            }
        );
    } catch (error) {
        throw new ApiError(500, 'Error generating access token');
    }
}

// Generate refresh token method
userSchema.methods.generateRefreshToken = function () {
    try {
        return jwt.sign(
            {
                _id: this._id,
            },
            process.env.REFRESH_TOKEN_SECRET,
            {
                expiresIn: process.env.REFRESH_TOKEN_EXPIRY || '10d' // Default expiry
            }
        );
    } catch (error) {
        throw new ApiError(500, 'Error generating refresh token');
    }
}


export const User = mongoose.model("User", userSchema)