const express = require('express');
const homeController = require('../controllers/homeController');
const parkinglotController = require('../controllers/parkinglotController');
const router = express.Router();

router.get('/', homeController.home);
router.get('/lot', parkinglotController.getAllLots);

module.exports = router;