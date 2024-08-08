const express = require('express');
const router = require('./src/router/index')
const mongoose = require('mongoose')
const cors = require('cors')
require('dotenv').config()


const app = express();


app.use(express.json());
app.use(cors({
    origin:'*'
}))

app.use(router);

PORT = process.env.PORT
DBURI = process.env.DB_URI
mongoose.connect(DBURI)
.then(()=>{
    console.log("Connected to database")
}).catch((error)=>{
    console.log(error)

})

app.listen(PORT,()=>{
    console.log(`Server is running on ${PORT}`)
})