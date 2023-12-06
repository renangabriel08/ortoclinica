const express = require('express');
const router = express.Router();
const multer = require('multer');

const login = require('../middleware/login.middleware');
const medicosController = require('../controllers/medicos.controller');

const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, './assets');
    },
    filename: (req, file, cb) => {
        cb(null, new Date().getTime() + '-' + file.originalname);
    }
});
const upload = multer({
    storage: storage
});


router.get(
    '/',
    login.required,
    medicosController.getMedicosDisponiveis
);

module.exports = router;