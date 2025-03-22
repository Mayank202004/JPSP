import { Router } from "express";
import {createScholarship,getAllScholarships,deleteScholarship,updateScholarship}  from "../controllers/scholarship.controller.js";

const router = Router();


router.route("/").post(createScholarship);
router.route("/").get(getAllScholarships);
router.route("/:id").delete(deleteScholarship);
router.route("/:id").patch(updateScholarship);

export default router;
