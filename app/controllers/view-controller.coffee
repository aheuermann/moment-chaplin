Controller = require 'controllers/base/controller'
MomentPageView = require 'views/moment-view'
Moment = require 'models/moment'

module.exports = class ViewController extends Controller
  index:(args) ->
    @alertInfo("Loading...")
    moment = new Moment()
    moment.id = args.id
    moment.fetch (
      success: => 
        @alertClear()
        @view = new MomentPageView {region: 'main', model: moment}
      error: => 
        @alertError()
    )

    
