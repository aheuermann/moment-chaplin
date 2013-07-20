View = require 'views/base/view'
template = require 'views/templates/errors/generic'

module.exports = class ErrorView extends View
  className: 'error'
  template: template
