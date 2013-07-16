template = require 'views/templates/recent'
View = require 'views/base/view'
CollectionView = require 'views/base/collection-view'

ItemView = class MomentItemView extends View
  template: template

module.exports = class RecentPageView extends CollectionView
  className: 'recent-page'
  itemView: ItemView
