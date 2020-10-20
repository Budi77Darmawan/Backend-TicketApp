/* eslint-disable camelcase */

const db = require('../helper/database')
module.exports = {

  postPaymentModel: (setData) => {
    return new Promise((resolve, reject) => {
      db.query('INSERT INTO payment SET ?', setData, (error, result) => {
        if (!error) {
          resolve(result)
        } else {
          reject(new Error(error))
        }
      })
    })
  },

  checkPriceModel: (arr) => {
    return new Promise((resolve, reject) => {
      db.query(`SELECT * FROM price WHERE id_plane='${arr[0]}' AND order_class='${arr[1]}' AND passengger='${arr[2]}' AND city_destination='${arr[3]}' AND city_departure='${arr[4]}' AND times_flight= '${arr[5]}'`, (error, result) => {
        if (!error) {
          resolve(result)
        } else {
          reject(new Error(error))
        }
      })
    })
  },
  postOrderModel: (setData, id_account, total_price) => {
    return new Promise((resolve, reject) => {
      db.query('BEGIN')
      db.query('INSERT INTO `order` SET ?', setData)
      db.query(`INSERT INTO payment (id_order, id_account, total_price) VALUES (LAST_INSERT_ID(), ${id_account}, ${total_price})`)
      db.query('COMMIT', (error, result) => {
        if (!error) {
          resolve(result)
        } else {
          reject(new Error(error))
        }
      })
    })
  },
  detailOrderbyIDModel: (id_order) => {
    return new Promise((resolve, reject) => {
      console.log(id_order)
      db.query('SELECT * FROM `order` AS O INNER JOIN price AS P ON O.id_price = P.id_price WHERE O.id_order = ?', id_order, (error, result) => {
        if (!error) {
          resolve(result)
        } else {
          reject(new Error(error))
        }
      })
    })
  },
  detailOrderModel: (id_account) => {
    return new Promise((resolve, reject) => {
      db.query('SELECT O.id_order, O.order_name, PAY.status_payment, P.price, P.order_class, P.times_flight, A.code_country AS code_depature, A.city_name AS city_departure, A.code_country AS code_country_depature, A.country_name AS country_depature, airport.code_city AS code_destination,  airport.city_name AS city_destinantion, airport.code_country AS code_country_destination, airport.country_name AS country_destination, plane.plane_name, plane.plane_image FROM `order` AS O INNER JOIN price AS P ON O.id_price = P.id_price INNER JOIN payment AS PAY ON O.id_order = PAY.id_order INNER JOIN plane ON plane.id_plane = P.id_plane INNER JOIN airport AS A ON A.code_city = P.city_departure INNER JOIN airport ON airport.code_city = P.city_destination WHERE O.id_account = ?', id_account, (error, result) => {
        if (!error) {
          resolve(result)
        } else {
          reject(new Error(error))
        }
      })
    })
  },

  getTicketDataModel: (searchKey, searchValue, limit, offset, city_departure, city_destination, order_class, passengger, callBack) => {
    db.query(`SELECT plane.plane_image, price.city_departure, price.city_destination, price.time_departure,
    price.time_destination, price.price FROM price INNER JOIN plane ON price.id_plane = 
    plane.id_plane WHERE ${searchKey} LIKE '%${searchValue}%' AND price.city_destination = '${city_destination}' AND price.city_departure = '${city_departure}' AND price.order_class = '${order_class}' AND price.passengger = '${passengger}' LIMIT ${limit} OFFSET ${offset}`,
    (err, result, fields) => {
      !err ? callBack(result) : callBack(err)
    })
  }
}
