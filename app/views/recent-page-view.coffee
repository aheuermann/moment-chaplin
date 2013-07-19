template = require 'views/templates/recent'
View = require 'views/base/view'
CollectionView = require 'views/base/collection-view'

ItemView = class MomentItemView extends View
  className: 'span5 item effeckt-caption effeckt-caption-2'
  template: template

  attach: ->
    super
    @$el.hide()
    if @model.collection.indexOf(@model)%2 == 0
      setTimeout =>
        @$el.show().addClass('effeckt-page-transition-right-slide-in')
      , 200*@model.collection.indexOf(@model)/2
    else
      setTimeout =>
        @$el.show().addClass('effeckt-page-transition-left-slide-in')
      , 200*@model.collection.indexOf(@model)/2

module.exports = class RecentPageView extends CollectionView
  className: 'recent-page'
  itemView: ItemView
  animationDuration:0

  initItemView: (model)->
    super

