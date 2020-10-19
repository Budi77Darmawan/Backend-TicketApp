const {
  listAirportModel
} = require('../models/airport')

require('dotenv')

module.exports = {
  listAirport: async (request, response) => {
    let { search } = request.query
    let searchKey = ''
    let searchValue = ''
    if (typeof search === 'object') {
      searchKey = Object.keys(search)[0]
      searchValue = Object.values(search)[0]
    } else {
      searchKey = 'city_name'
      searchValue = search || ''
    }
    try {
      const list = await listAirportModel(searchKey, searchValue)
      response.send({
        success: true,
        message: 'List Airport!',
        data: list
      })
    } catch (error) {
      console.log(error)
      response.status(400).send({
        success: false,
        message: 'Bad Request'
      })
    }
  }
}
