const pool = require('../config/postgres');

module.exports.bayByGlobal = async function(req, res){
    try{
        const lot_name = req.params.lot_name;

        const results = await pool.query('Select * from parking_lots where plname = $1;', [lot_name]);
        const lot_id = results.rows[0].plid;

        try{
            const bay_name = req.params.bay_name;
            const results1 = await pool.query('Select * from bay where plid = $1 and bname = $2;', [lot_id, bay_name]);

            return res.status(200).json(results1.rows[0]);
        }
        catch(err){
            console.log('Error while finding bay for a parking lot_name: ', err);
            return res.status(500).send('Internal Server Error.');
        }
    }
    catch(err){
        console.log('Error while finding parking lot for given lot_name: ', err);
        return res.status(500).send('Internal Server Error.');
    }
}