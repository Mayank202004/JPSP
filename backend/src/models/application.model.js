import mongoose, { Schema } from "mongoose";

const applicationSchema = new Schema(
    {
        userId: {
            type: Schema.Types.ObjectId,
            ref: "User",
        },
        profileId: {
            type: Schema.Types.ObjectId,
            ref: "Profile",
        },
        scholarshipId:{
            type: Schema.Types.ObjectId,
            ref: "Scholarship",
        },
        to: [{
            authority: {
              type: String,
              required: true,
            },
            status: {
              type: String,
              enum: ["approved", "rejected", "pending","returned back to applicant"],
              default: "pending",
            }
        }],
        reviewComments: [{
            type: String,
            default: ""
        }],
        status: {
            type: String,
            enum: ["pending", "returned back to applicant", "approved", "rejected"],
            default: "pending",
        },
        currentRecipient: {
            type: String,
            required: true
        },  
    },
    {timestamps: true}
);
applicationSchema.index({ profileId: 1, scholarshipId: 1 });
const Application = mongoose.model("Application", applicationSchema);
export default Application;