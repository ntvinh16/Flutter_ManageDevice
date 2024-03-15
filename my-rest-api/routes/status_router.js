
const express = require('express');
const router = express.Router();

const { CreateStatus } = require('../controllers/status_controller');

/* GET quotes listing. */
router.get('/status/create', CreateStatus);


module.exports = router;