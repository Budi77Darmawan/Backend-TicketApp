const { Router } = require('express')
const {
  orderUser,
  getDataPrice,
  detailOrder
} = require('../controllers/price')

const router = Router()

router.get('/plane', getDataPrice)
router.post('/', orderUser)
router.get('/detail/:id', detailOrder)

module.exports = router
