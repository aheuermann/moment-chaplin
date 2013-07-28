Controller = require 'controllers/base/controller'
RecentPageView = require 'views/recent_page_view'
ErrorView = require 'views/errors/error_view'
Moments = require 'models/moments'

module.exports = class RecentController extends Controller
  redirect: -> 
    @redirectToRoute 'recent'
  
  index: ->
    @alertInfo("Loading...")
    moments = new Moments()
    @request = moments.fetch(
      success: => 
        @request = null
        @alertClear()
        @view = new RecentPageView {region: 'main', collection: moments}
      error: =>
        @request = null
        @alertClear()
        @view = new ErrorView {region: 'main'}
    )
    
  dispose: ->
    @request.abort() if @request
    super