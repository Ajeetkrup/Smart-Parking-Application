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

module.exports.getLotandAllBays = async function(req, res){
    const lot_name = req.params.lot_name;

    try{
        const results = await pool.query('Select * from parking_lots where plname = $1;', [lot_name]);
        const lot_id = results.rows[0].plid;

        try{
            const results1 = await pool.query('Select * from bay where plid = $1;', [lot_id]);

            const lotandAllBays = {
                'parking_lot': 1,
                'bays': 2
            }

            lotandAllBays.parking_lot = results.rows[0];
            lotandAllBays.bays = results1.rows;

            return res.status(200).json(lotandAllBays);
        }
        catch(err){
            console.log('Error while finding bays for a parking lot: ', err);
            return res.status(500).send('Internal Server Error.');
        }
    }
    catch(err){
        console.log('Error while finding parking lot for given lot_name: ', err);
        return res.status(500).send('Internal Server Error.');
    }
}