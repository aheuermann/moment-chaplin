Collection = require 'models/base/collection'
Moment = require 'models/moment'

module.exports = class Moments extends Collection
  model: Moment
  url: 'http://moment-api.herokuapp.com/moments'
