View = require 'views/base/view'
template = require 'views/templates/header'

module.exports = class HeaderView extends View
  className: 'error'
  initialize: (options) ->
    @template =options.template
    super