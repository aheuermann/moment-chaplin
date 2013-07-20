Controller = require 'controllers/base/controller'
_404View = require 'views/errors/404_view'


module.exports = class HomeController extends Controller
  404: ->
    @view = new _404View {region: 'main'}
