
const express = require('express');
const router = express.Router();

const { Login } = require('../controllers/login_controller');

/* GET quotes listing. */

router.post('/login', Login);


module.exports = router;