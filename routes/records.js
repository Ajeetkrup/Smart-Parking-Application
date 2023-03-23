const express = require('express');
const recordController = require('../controllers/recordController');

const router = express.Router();

router.post('/', recordController.data);
router.get('/getRecords', recordController.getData);

module.exports = router;