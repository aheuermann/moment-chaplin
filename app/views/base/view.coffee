Chaplin = require 'chaplin'
require 'lib/view-helper' # Just load the view helpers, no return value

module.exports = class View extends Chaplin.View
  autoRender: yes
  # Precompiled templates function initializer.
  getTemplateFunction: ->
    @template

  alertInfo: (message) ->
    @publishEvent 'alert', {type: 'alert-info', message:message}

  alertError: (message= "Oops, that wasn't supposed to happen...") ->
    @publishEvent 'alert', {type: 'alert-error', message:message}

  alertClear: ->
    @publishEvent 'clearAlert'

