import { Router } from "express";

import * as userController from "../controllers/user.controller.js";

const router = Router();

router.post("/register", userController.registerUser);

export default router;