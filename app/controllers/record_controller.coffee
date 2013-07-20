Controller = require 'controllers/base/controller'
RecordPageView = require 'views/record_page_view'

module.exports = class HomeController extends Controller
  index: ->
    @view = new RecordPageView region: 'main'
