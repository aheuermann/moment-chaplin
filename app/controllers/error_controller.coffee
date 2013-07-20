Controller = require 'controllers/base/controller'
View = require 'views/error_view'
_404 = require 'views/templates/404'

module.exports = class HomeController extends Controller
  404: ->
    console.log "dsds"
    @view = new View {region: 'main', template:_404}
