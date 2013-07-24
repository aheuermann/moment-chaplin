ImageView = require 'views/image_view'
Model = require 'models/moment'

class ImageViewTest extends ImageView
  renderTimes: 0
  render: ->
    super
    @renderTimes += 1

describe 'ImageView', ->
  beforeEach ->
    @view = new ImageViewTest ({model: new Model()})
  afterEach ->
    @view.dispose()

  it 'should rerender when the fileData is changed', ->
    expect(@view.renderTimes).to.equal 1 #initial
    @view.model.set 'fileData', 'DATA'
    expect(@view.renderTimes).to.equal 2 #model change event