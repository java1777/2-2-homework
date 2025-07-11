import { Router } from "express";
import { createStudent } from "../controllers/students.controller.js";

const router = Router();

router
    .post('/', createStudent)
    .get('/', getAllUsers)
    .get('/:id', getByIdUser)
    .put('/:id', updateUser)
    .delete('/:id', deleteUser)

export default router;