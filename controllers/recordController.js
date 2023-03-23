const pool = require('../config/postgres');

module.exports.data = async function(req, res){
    try{
        const sid = req.body.sid;

        const bay = await pool.query('Select bid from sensor where sid = $1;', [sid]);
        const bayid = bay.rows[0].bid;

        try{
            const occupy = req.body.occupy;
            await pool.query('Update bay set occupy = $1 where bid = $2;',[occupy, bayid]);

            try{
                await pool.query('Insert into records (sid, bid, status, time) values ($1, $2, $3, $4);', [sid, bayid, occupy, req.body.timestamp]);

                return res.status(200).send('Successfully updated occupy status and inserted data.');
            }
            catch(err){
                console.log('Error while inserting records: ', err);
                return res.status(500).send('Internal Server Error.');
            }
        }
        catch(err){
            console.log('Error while updating bay: ', err);
            return res.status(500).send('Internal Server Error.');
        }
    }
    catch(err){
        console.log('Error while finding sensor: ', err);
        return res.status(500).send('Internal Server Error.');
    }
}

module.exports.getData = async function(req, res){
    try{
        let d1 = new Date();
        d1 = d1.toISOString().split('T')[0];
        // d1 = new Date(d1).getTime();

        let query = "Select * from records where created_at =";
        query += "'"+d1+"'" + ";";

        // console.log(d1, query);
        const results = await pool.query(query);

        return res.status(200).json(results.rows);
    }
    catch(err){
        return res.status(500).send('Internal Server Error.');
    }
}