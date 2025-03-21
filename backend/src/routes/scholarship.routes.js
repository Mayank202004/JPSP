import { Router } from "express";
import {createScholarship,getAllScholarships,deleteScholarship}  from "../controllers/scholarship.controller.js";

const router = Router();


router.route("/").post(createScholarship);
router.route("/").get(getAllScholarships);
router.route("/:id").delete(deleteScholarship);

export default router;
