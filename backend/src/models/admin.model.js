import mongoose, { Schema } from "mongoose";

const adminSchema = new Schema(
    {
        userId: {
            type: Schema.Types.ObjectId,
            ref: "User",
            required: true,
        },
        position: {
            type: String,
            enum: ["Desk 1 Officer", "Desk 2 Officer", "DDO"],
            required: true,
        },
        instituteId: {
            type: Schema.Types.ObjectId,
            ref: "Institute", // For Desk 1 Officer
            default: null,
        },
        scholarshipId: {
            type: Schema.Types.ObjectId,
            ref: "Scholarship", // For Desk 2 Officer & DDO
            default: null,
        },
        verified: {
            type: Boolean,
            default: false,
        }
    },
    { timestamps: true }
);

const Admin = mongoose.model("Admin", adminSchema);
export default Admin;