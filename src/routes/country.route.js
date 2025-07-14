import { Router } from "express";
import { CountryController } from "../controllers/country.controller.js";

const router = Router();
const controller = new CountryController();

router
    .post('/', controller.createCountry)
    .get('/', controller.getAllCountries)
    .get('/', controller, getCountryById)

export default router;