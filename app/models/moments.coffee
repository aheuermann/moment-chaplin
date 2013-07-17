Collection = require 'models/base/collection'
Moment = require 'models/moment'

module.exports = class Moments extends Collection
  model: Moment
  url: 'http://localhost:8080/moments'
  #url: 'http://moment-api.herokuapp.com/moments'
