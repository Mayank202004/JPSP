import { Router } from "express";
import { verifyJWT } from "../middlewares/auth.middleware.js";
import * as userController from "../controllers/user.controller.js";

const router = Router();

router.post("/register", userController.registerUser);
router.route("/login").post(userController.loginUser);

// Secured Routes
router.route("/logout").post(verifyJWT, userController.logoutUser);

export default router;
