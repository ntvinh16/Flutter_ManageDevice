
const express = require('express');
require('dotenv').config()


const dotenv = require('dotenv');
const bodyparser = require("body-parser");
const connectDB = require('./config/Database/connectionDB');


const app = express();
app.use(express.json());

const cors = require("cors")
app.use(cors({
        origin: '*'
    }));
    
    // parse request to body-parser
app.use(bodyparser.urlencoded({ extended: false }))
app.use(bodyparser.json())


dotenv.config( { path : 'config.env'} )
const PORT = process.env.PORT || 8080


// mongodb connection
connectDB();


// load routers
app.use('/', require('./routes/user_router'));
app.use('/', require('./routes/login_router'));
app.use('/', require('./routes/office_router'));
app.use('/', require('./routes/status_router'));



app.listen(PORT, ()=> { console.log(`Server is running on http://localhost:${PORT}`)});