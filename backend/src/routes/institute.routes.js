import { Router } from "express";
import { verifyJWT,verifyAdmin } from "../middlewares/auth.middleware.js";
import * as instituteController from "../controllers/institute.controller.js";

const router = Router();


router.route("/").get(instituteController.getAllInstitutes);
router.route("/:id").get(instituteController.getInstituteById);

// Secured Routes
router.route("/").post(verifyJWT,verifyAdmin, instituteController.createInstitute);
router.route("/:id").put(verifyJWT,verifyAdmin, instituteController.updateInstitute);
router.route("/:id").delete(verifyJWT,verifyAdmin, instituteController.deleteInstitute);

export default router;
