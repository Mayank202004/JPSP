import { Router } from "express";
import { verifyJWT } from "../middlewares/auth.middleware.js";
import * as profileController from "../controllers/profile.controller.js";
import { upload } from "../middlewares/multer.middleware.js";

const router = Router();



// Secured Routes
router.route("/").get(verifyJWT,profileController.fetchProfile);
router.route("/personalinfo").put(verifyJWT,upload.single("aadharCard"),profileController.addPersonalInfo);
router.route("/incomeinfo").put(verifyJWT,upload.single("incomeCertificate"),profileController.addIncomeInfo);
router.route("/domicileinfo").put(verifyJWT,upload.single("domicileCertificate"),profileController.addDomicileInfo);
router.route("/bankinfo").put(verifyJWT,profileController.addBankInfo);
router.route("/addressinfo").put(verifyJWT,profileController.addAddressInfo);
router.route("/parentsinfo").put(verifyJWT,profileController.addParentsInfo);
router.route("/pastqualification").put(verifyJWT,upload.single("certificate"),profileController.addPastQualification);
router.route("/currentqualification").put(verifyJWT,upload.single("certificate"),profileController.addCurrentQualification);
router.route("/currentqualification/:index").delete(verifyJWT, profileController.deleteCurrentQualification);
router.route("/pastqualification/:index").delete(verifyJWT, profileController.deletePastQualification);
router.route("/hostelinfo").put(verifyJWT,upload.single("certificate"),profileController.addHostelInfo);



export default router;
