const { Router } = require('express')
const {
  listAirport
} = require('../controllers/airport')

const router = Router()

router.get('/', listAirport)
module.exports = router
