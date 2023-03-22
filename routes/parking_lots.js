const express = require('express');
const parkinglotController = require('../controllers/parkinglotController');

const router = express.Router();

router.get('/', parkinglotController.getAllLots);
router.get('/:lot_name', parkinglotController.getLotandAllBays);

module.exports = router;