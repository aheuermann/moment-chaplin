View = require 'views/base/view'
template = require 'views/templates/view'

module.exports = class MomentPageView extends View
  template: template
  
  attach: ->
    super
    @initializeMap()

  initializeMap: ->
    if @model.get('loc')? and @model.get('loc')?.length > 1
      mapOptions = {
        center: new google.maps.LatLng(@model.get('loc')[0],  @model.get('loc')[1]),
        zoom: 15,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      }
      map = new google.maps.Map(@$el.find(".map")[0], mapOptions)
      
      new google.maps.Marker {
        position: new google.maps.LatLng(@model.get('loc')[0], @model.get('loc')[1]),
        map: map
      }

