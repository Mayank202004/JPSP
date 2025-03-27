import { Router } from "express";
import { verifyJWT, verifyAdmin } from "../middlewares/auth.middleware.js";
import * as notificationController from "../controllers/notification.controller.js";


const router = Router();

// Secured Routes
router.route("/").get(verifyJWT, notificationController.getNotifications);
router.route("/recent").get(verifyJWT, notificationController.getRecentNotifications);
router.route("/").post(verifyJWT, verifyAdmin, notificationController.addNotification);

export default router;