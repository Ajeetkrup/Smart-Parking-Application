const pool = require('../config/postgres');

module.exports.data = async function(req, res){
    try{
        const sid = req.body.sid;

        const bay = await pool.query('Select bid from sensor where sid = $1;', [sid]);
        const bayid = bay.rows[0].bid;

        try{
            const occupy = req.body.occupy;
            await pool.query('Update bays set occupy = $1 where bid = $2;',[occupy, bayid]);

            await pool.query('Insert into records (sid, bid, status, timestamp) values ($1, $2, $3, $4);', [sid, bayid, occupy, req.body.timestamp]);
        }
        catch(err){
            return res.status(500).send('Internal Server Error.');
        }
    }
    catch(err){
        return res.status(500).send('Internal Server Error.');
    }
}