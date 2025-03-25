import mongoose, { Schema } from "mongoose";

const instituteSchema = new Schema(
    {
        name: {
            type: String,
            required: true,
            unique: true,
        },
        address: {
            type: String,
            required: true,
        },
        city: {
            type: String,
            required: true,
        },
        state: {
            type: String,
            required: true,
        },
        country: {
            type: String,
            required: true,
        },
        postalCode: {
            type: String,
            required: true,
        },
        contactEmail: {
            type: String,
            required: true,
            unique: true,
        },
        contactPhone: {
            type: String,
            required: true,
        },
    },
    { timestamps: true }
);

const Institute = mongoose.model("Institute", instituteSchema);
export default Institute;
