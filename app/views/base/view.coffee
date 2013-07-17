Chaplin = require 'chaplin'
require 'lib/view-helper' # Just load the view helpers, no return value

module.exports = class View extends Chaplin.View
  autoRender: yes
  # Precompiled templates function initializer.
  getTemplateFunction: ->
    @template

  alertInfo: (message, autoClear) ->
    @_alert 'alert-info', message, autoClear

  alertError: (message= "Oops, that wasn't supposed to happen...", autoClear) ->
    @_alert 'alert-error', message, autoClear

  alertSuccess: (message, autoClear) ->
    @_alert 'alert-success', message, autoClear

  _alert: (type, message, autoClear=false) ->
    @publishEvent 'alert', {type: type, message:message, autoClear: autoClear}

  alertClear: ->
    @publishEvent 'clearAlert'

