RecordView = require 'views/record_page_view'
Model = require 'models/moment'

class RecordViewTest extends RecordView
  renderTimes: 0
  render: ->
    super
    @renderTimes += 1

describe 'RecordView', ->
  invalidInput= 
    placeRef: "Test"
    date: new Date()
  validInput=
    placeRef: "Test"
    date: new Date()
    title: "Test"
  beforeEach ->
    @view = new RecordViewTest
    @view.model.set {fileData: "TEST"}
  afterEach ->
    @view.dispose()
  
  it 'should display an alert on an invalid form', ->
    @view.input = sinon.stub().returns(invalidInput)
    alert = sinon.spy @view, 'alertError'
    @view.save()
    expect(alert).to.be.called.once

  it 'should upload the image on valid input', ->
    @view.input = sinon.stub().returns(validInput)
    @view.uploadImage = sinon.stub()
    @view.save()
    expect(@view.uploadImage).to.be.called.once
  
  it 'should save after uplodaing the image', ->
    @view.input = sinon.stub().returns(validInput)
    @view.uploadImage= sinon.stub().callsArgWith 0, { data: {link: "http://example.com/123", id: "123", deleteHash: "delete"}}
    save = sinon.stub(@view.model, 'save')
    @view.save()
    expect(save).to.be.called.once

  it 'should disable the save button when saving', ->
    @view.input = sinon.stub().returns(validInput)
    @view.uploadImage = sinon.stub()
    @view.save()
    expect(@view.$el.find('.save').attr('data-loading')).to.equal 'true'
