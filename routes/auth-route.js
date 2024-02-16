const express = require('express');
const router = express.Router();
const authController = require('../controllers/auth-controller');

router.post("/register", authController.register);
router.post("/login", authController.login);
router.get("/me", authController.getme);
// router.post("/forget-password", authController.forgetPassword);
// router.post("/forget-password/:token", authController.verifyForgetPassword);
// router.post("/reset-password", authController.resetPassword);

module.exports = router;
