View = require 'views/base/view'
template = require 'views/templates/site'

# Site view is a top-level view which is bound to body.
module.exports = class SiteView extends View
  autoRender: no
  container: 'body'
  id: 'site-container'
  regions:
    '#header-container': 'header'
    '#page-container': 'main'
  template: template
  
  listen:
    'alert mediator': 'alert'
    'clearAlert mediator' : 'clearAlert'

  alert: (obj)->
    @$el.find('.globalAlert')
      .removeClass('alert-info alert-error alert-success')
      .addClass("#{obj.type} active")
      .html(obj.message)
    if obj.autoClear
      _.delay =>
        @clearAlert()
      , 2500 
  
  clearAlert: ->
    @$el.find('.globalAlert')
      .removeClass('active')

