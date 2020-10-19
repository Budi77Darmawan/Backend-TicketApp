const db = require('../helper/database')

module.exports = {
  listAirportModel: (searchKey, searchValue) => {
    return new Promise((resolve, reject) => {
      db.query(`SELECT * FROM airport WHERE ${searchKey} LIKE '%${searchValue}%'`, (error, result) => {
        if (!error) {
          resolve(result)
        } else {
          reject(new Error(error))
        }
      })
    })
  }
}
