View = require 'views/base/view'
template = require 'views/templates/header'

module.exports = class HeaderView extends View
  className: 'header'
  region: 'header'
  id: 'header'
  template: template