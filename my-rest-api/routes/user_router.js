
const express = require('express');
const router = express.Router();

const { createUser } = require('../controllers/user_controller');

/* GET quotes listing. */

router.post('/user/create', createUser);


module.exports = router;