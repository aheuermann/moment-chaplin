SiteView = require 'views/site_view'

class SiteViewTest extends SiteView
  initialize: ->
    @clearAlert = sinon.spy()
    @alert = sinon.spy()

describe 'SiteView', ->
  beforeEach ->
    @view = new SiteViewTest()
  afterEach ->
    @view.dispose()

  it 'should display an alert', ->
    Chaplin.mediator.publish 'alert', {message: "message", type: 'alert-info'}
    expect(@view.alert).to.be.called.once

  it 'should clear an alert', ->
    Chaplin.mediator.publish 'clearAlert'
    expect(@view.clearAlert).to.be.called.once
