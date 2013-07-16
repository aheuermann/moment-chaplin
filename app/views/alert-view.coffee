View = require 'views/base/view'
template = require 'views/templates/alert'

module.exports = class HeaderView extends View
  template: template

  dispose: ->
    _.delay ->
      super
    , 1000 #equal to css3 transition