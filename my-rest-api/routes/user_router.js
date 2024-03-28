
const express = require('express');
const router = express.Router();

const { createUser, getAllUser } = require('../controllers/user_controller');

/* GET quotes listing. */

router.post('/user/create', createUser);
router.get('/user/getAllUser', getAllUser);


module.exports = router;