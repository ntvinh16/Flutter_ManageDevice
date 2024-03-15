const express = require('express');
const router = express.Router();

const { createOffice } = require('../controllers/office_controller');

/* GET quotes listing. */

router.post('/office/create', createOffice);


module.exports = router;