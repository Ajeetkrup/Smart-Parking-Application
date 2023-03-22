const express = require('express');
const homeController = require('../controllers/homeController');
const router = express.Router();

router.get('/', homeController.home);
router.use('/lot', require('./parking_lots'));
router.use('/bay', require('./bays'));

module.exports = router;