Model = require 'models/base/model'

module.exports = class Moment extends Model
  urlRoot: 'http://moment-api.herokuapp.com/moment'
