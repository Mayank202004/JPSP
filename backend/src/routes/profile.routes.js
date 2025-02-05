import { Router } from "express";
import { verifyJWT } from "../middlewares/auth.middleware.js";
import * as profileController from "../controllers/profile.controller.js";
import { upload } from "../middlewares/multer.middleware.js";

const router = Router();



// Secured Routes
router.route("/personalinfo").put(verifyJWT,upload.single("aadharCard"),profileController.addPersonalInfo)
router.route("/incomeinfo").put(verifyJWT,upload.single("incomeCertificate"),profileController.addIncomeInfo)

export default router;
