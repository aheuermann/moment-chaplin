SiteView = require 'views/site_view'
HeaderView = require 'views/header_view'

module.exports = class Controller extends Chaplin.Controller
  beforeAction: ->
    @compose 'site', SiteView
    @compose 'header', HeaderView

  alertInfo: (message) ->
    @publishEvent 'alert', {type: 'alert-info', message:message}

  alertError: (message= "Oops, that wasn't supposed to happen...") ->
    @publishEvent 'alert', {type: 'alert-error', message:message}

  alertClear: ->
    @publishEvent 'clearAlert'
