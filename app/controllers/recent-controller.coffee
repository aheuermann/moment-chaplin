Controller = require 'controllers/base/controller'
RecentPageView = require 'views/recent-page-view'
Moments = require 'models/moments'

module.exports = class RecentController extends Controller
  redirect: -> @redirectToRoute 'recent'
  index: ->
    @alertInfo("Loading...")
    moments = new Moments()
    moments.fetch(
      success: => 
        @alertClear()
        @view = new RecentPageView {region: 'main', collection: moments}
      error: => 
        @alertError()
    )
    
