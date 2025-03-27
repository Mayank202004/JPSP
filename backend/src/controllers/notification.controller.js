import { ApiResponse } from "../utils/ApiResponse.js";
import { asyncHandler } from "../utils/asyncHandler.js";
import { ApiError } from "../utils/ApiError.js";
import { Notification } from "../models/notification.model.js";


/**
 * @desc Add Notification
 * @route POST /api/notifications
 * @access Private (Admin)
 */
export const addNotification = asyncHandler(async (req, res) => {
    const {to,from,title,message} = req.body;
    if(!to || !from || !title || !message){
        throw new ApiError(400, "Missing Fields");
    }
    const notification = new Notification({to,from,title,message});
    if(notification){
        await notification.save();
        res.status(201).json(new ApiResponse(201, null, "Notification Created"));
    }else{
        throw new ApiError(500, "Failed to create notification");
    }
});

/**
 * @desc Get Notifications
 * @route GET /api/notifications
 * @access Private (User)
 */
export const getNotifications = asyncHandler(async (req, res) => {
    const notifications = await Notification.find({to: req.user._id}).sort({createdAt: -1});
    if(!notifications){
        throw new ApiError(404, "No Notifications Found");
    }
    res.status(200).json(new ApiResponse(200, notifications, "Your Nofiications"));
});

/**
 * @desc Get Recent Notifications
 * @route GET /api/notifications/recent
 * @access Private (User)
 */
export const getRecentNotifications = asyncHandler(async (req, res) => {
    const notifications = await Notification.find({to: req.user._id}).sort({createdAt: -1}).limit(10);
    if(!notifications){
        throw new ApiError(404, "No Notifications Found");
    }
    res.status(200).json(new ApiResponse(200, notifications, "Your Recent Nofiications"));
});