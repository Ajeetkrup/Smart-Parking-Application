const  express = require('express');
const app = express();
const bodyParser = require('body-parser');
const port = 8000;

const db = require('./config/postgres');

app.use(bodyParser.urlencoded({extended:false}));
app.use('/', require('./routes'));


app.listen(port, function(err){
    if(err){
        console.log('Error while starting app: ', err);
    }

    console.log(`Server is up and running at port: ${port}`);
});