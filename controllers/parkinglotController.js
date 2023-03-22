const pool = require('../config/postgres');

module.exports.getAllLots = function(req, res){
    pool.query('Select * from parking_lots;', function(err, results){
        if(err){
            console.log('Error while finding lots: ', err);
            return res.status(500).send('Internal Server Error.');
        }

        return res.status(200).json(results.rows);
    });
}