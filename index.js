const bodyParser = require('body-parser')
const express = require('express')
const app = express()
require('dotenv').config()
const cors = require('cors')

app.use('/uploads', express.static('Uploads'))

const account = require('./src/routes/account')
// const order = require('./src/routers/price')
const profileRouter = require('./src/routes/profile')

app.use(bodyParser.urlencoded({ extended: false }))
app.use('/account', account)
// app.use('/order', order)
app.use('/profile', profileRouter)

app.use(cors())

app.use((request, response, next) => {
  response.header('Access-Control-Allow-Origin', '*')
  response.header(
    'Access-Control-Allow-Headers',
    'Origin, X-Requested-With, Content-Type, Accept',
    'Authorization')
  next()
})

app.get('/', (request, response) => {
  response.send('ALJABAR Android 1 Backend')
})

app.listen(process.env.PORT, () => {
  console.log(`App Listen on Port ${process.env.PORT}!`)
})
