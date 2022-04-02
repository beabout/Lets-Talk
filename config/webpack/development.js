process.env.NODE_ENV = process.env.NODE_ENV || 'development.js'

const environment = require('./environment')

module.exports = environment.toWebpackConfig()
