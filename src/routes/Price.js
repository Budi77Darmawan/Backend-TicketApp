const { Router } = require('express')
const {
  orderUser,
  getDataPrice,
  detailOrderbyID,
  detailOrder,
  getTicketData
} = require('../controllers/price')

const { authorization } = require('../middleware/auth')
const router = Router()

router.get('/plane', getDataPrice)
router.post('/', authorization, orderUser)
router.get('/detail/:id', authorization, detailOrderbyID)
router.get('/detail/', authorization, detailOrder)
router.get('/ticket/', authorization, getTicketData)

module.exports = router
