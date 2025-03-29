import mongoose from "mongoose";
import { Schema } from "mongoose";

const notificationSchema = new Schema(
    {
        to:{
            type: Schema.Types.ObjectId,
            ref: "User",
            required: true
        },
        from:{
            type: Schema.Types.ObjectId,
            ref: "User",
            required: true
        },
        title:{
            type: String,
            required: true
        },
        message:{
            type: String,
            required: true
        },
    },
    {timestamps: true}
);

export const Notification = mongoose.model("Notification", notificationSchema);
