Controller = require 'controllers/base/controller'
RecordPageView = require 'views/record-page-view'

module.exports = class HomeController extends Controller
  index: ->
    @view = new RecordPageView region: 'main'
