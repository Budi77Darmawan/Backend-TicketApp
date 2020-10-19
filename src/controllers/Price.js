/* eslint-disable camelcase */

const {
  checkPriceModel,
  postOrderModel,
  detailOrderbyIDModel,
  detailOrderModel,
  getTicketDataModel
} = require('../models/price')

const jwt = require('jsonwebtoken')
const bcrypt = require('bcrypt')
require('dotenv')

module.exports = {
  orderUser: async (request, response) => {
    try {
      let id_account = ''
      const token = request.headers.authorization.split(' ')[1]
      jwt.verify(token, process.env.JWT_KEY, (error, result, response) => {
        if ((error && error.name === 'JsonWebTokenError') || (error && error.name === 'TokenExpiredError')) {
          response.status(403).send({
            success: false,
            message: error.message
          })
        } else {
          id_account = result.id_account
        }
      })
      const { order_name, total_price, id_plane, passengger, order_class, city_destination, city_departure, times_flight } = request.body

      const checkDataPrice = await checkPriceModel([id_plane, order_class, passengger, city_destination, city_departure, times_flight])

      const setData = {
        id_account,
        id_price: checkDataPrice[0].id_price,
        order_name,
        created_at: new Date(),
        update_at: new Date()
      }

      await postOrderModel(setData, id_account, total_price)

      response.send({
        success: true,
        message: 'Succes order!',
        data: setData
      })
    } catch (error) {
      console.log(error)
      response.status(400).send({
        success: false,
        message: 'Bad Request'
      })
    }
  },

  getDataPrice: async (request, response) => {
    try {
      const { id_plane, order_class, nadult, nchild, city_destination, city_departure, times_flight } = request.body

      if (nadult >= 0 && nchild >= 0) {
        let passengger = 'adult'
        const checkDataPrice = await checkPriceModel([id_plane, order_class, passengger, city_destination, city_departure, times_flight])
        const price1 = (checkDataPrice[0].price) * nadult

        passengger = 'child'
        const checkDataPrice2 = await checkPriceModel([id_plane, order_class, passengger, city_destination, city_departure, times_flight])
        const price2 = (checkDataPrice2[0].price) * nchild

        var list = []
        for (let i = 0; i < checkDataPrice.length; i++) {
          const setDataArray = {
            totalharga: (checkDataPrice[i].price * nadult) + (checkDataPrice2[i].price * nchild),
            plane: checkDataPrice[i].id_plane,
            city_destination: checkDataPrice[i].city_destination,
            city_departure: checkDataPrice[i].city_departure,
            times_flight: checkDataPrice[i].times_flight,
            order_class: checkDataPrice[i].order_class
          }

          list[i] = setDataArray
        }

        response.send({
          success: true,
          message: 'Succes!',
          data: list
        })
      } else {
        response.status(400).send({
          success: false,
          message: 'All field must fill'
        })
      }
    } catch (error) {
      console.log(error)
      response.status(400).send({
        success: false,
        message: 'Bad Request'
      })
    }
  },

  detailOrderbyID: async (request, response) => {
    try {
      const id_order = request.params.id
      const result = await detailOrderbyIDModel(id_order)
      delete result[0].created_at
      delete result[0].update_at
      delete result[0].id_plane
      delete result[0].id_price
      response.send({
        success: true,
        message: 'Detail order!',
        data: result[0]
      })
    } catch (error) {
      response.status(400).send({
        success: false,
        message: 'Bad Request'
      })
    }
  },

  detailOrder: async (request, response) => {
    let id_account = ''
    const token = request.headers.authorization.split(' ')[1]
    jwt.verify(token, process.env.JWT_KEY, (error, result, response) => {
      if ((error && error.name === 'JsonWebTokenError') || (error && error.name === 'TokenExpiredError')) {
        response.status(403).send({
          success: false,
          message: error.message
        })
      } else {
        id_account = result.id_account
      }
    })
    try {
      const result = await detailOrderModel(id_account)
      delete result[0].created_at
      delete result[0].update_at
      delete result[0].id_plane
      delete result[0].id_price
      response.send({
        success: true,
        message: 'Detail order!',
        data: result[0]
      })
    } catch (error) {
      response.status(400).send({
        success: false,
        message: 'Bad Request'
      })
    }
  },

  getTicketData: (req, res) => {
    let { search, page, limit } = req.query
    let searchKey = ''
    let searchValue = ''
    if (typeof search === 'object') {
      searchKey = Object.keys(search)[0]
      searchValue = Object.values(search)[0]
    } else {
      searchKey = 'city_destination'
      searchValue = search || ''
    }
    !limit ? limit = 20 : limit = parseInt(limit)
    !page ? page = 1 : page = parseInt(page)
    const offset = (page - 1) * limit
    getTicketDataModel(searchKey, searchValue, limit, offset, result => {
      if (result.length) {
        res.status(200).send({
          success: true,
          message: 'list ticket',
          data: result
        })
      } else {
        res.status(404).send({
          success: false,
          message: 'there is no item on list'
        })
      }
    })
  }
}
