ErrorView = require 'views/errors/error_view'
template = require 'views/templates/errors/404'

module.exports = class HeaderView extends ErrorView
  className: 'error'
  template: template
