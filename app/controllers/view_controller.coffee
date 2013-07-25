Controller = require 'controllers/base/controller'
MomentPageView = require 'views/moment_view'
ErrorView = require 'views/errors/error_view'
_404View = require 'views/errors/404_view'
Moment = require 'models/moment'

module.exports = class ViewController extends Controller
  index:(args) ->
    @alertInfo("Loading...")
    moment = new Moment()
    moment.id = args.id
    @request = moment.fetch(
      success:(model, response, options) => 
        @alertClear()
        @view = new MomentPageView {region: 'main', model: moment}
      error:(model, response, options) => 
        @alertClear()
        if response.status is 404
          @view = new _404View {region: 'main'}
        else
          @view = new ErrorView {region: 'main'}
    )


  dispose: ->
    @request.abort() if @request
    super

    
