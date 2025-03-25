import { Router } from "express";
import { verifyJWT,verifyAdmin } from "../middlewares/auth.middleware.js";
import * as adminController from "../controllers/admin.controller.js";

const router = Router();


router.route("/").get(adminController.getAllAdmins);
router.route("/:id").get(adminController.getAdminById);


// Secured Routes
router.route("/").post(verifyJWT,verifyAdmin, adminController.createAdmin);
router.route("/:id").put(verifyJWT,verifyAdmin, adminController.updateAdmin);
router.route("/:id").delete(verifyJWT,verifyAdmin, adminController.deleteAdmin);


export default router;
