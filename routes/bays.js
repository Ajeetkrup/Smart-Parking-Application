const express = require('express');
const bayController = require('../controllers/baycontroller');

const router = express.Router();

router.get('/:lot_name/:bay_name', bayController.bayByGlobal);

module.exports = router;