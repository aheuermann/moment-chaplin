template = require 'views/templates/record'
View = require 'views/base/view'
ImageView = require 'views/image-view'
Moment = require 'models/moment'

module.exports = class RecordPageView extends View
  className: 'record-page'
  template: template

  events:
    'click .save' : 'save'
    'keyup form' : -> @publishEvent 'clearAlert'
  
  initialize: ->
    @model = new Moment()
    super

  attach: ->
    super

    #image picker and display view
    @subview 'img', new ImageView({container:'.imgViewContainer', model: @model})
   
    #date picker
    @$el.find('.pickdate').pickadate({
      onSet: (v) => 
        val = v?.select or ""
        @$el.find('.pickdate').data('ref', val)
    })

    #typeahead for place
    map= null
    @$el.find('.placeSuggest').typeahead {
      minLength: 3
      source: (q, process) ->
        $.get('http://moment-api.herokuapp.com/place/search', {q:q}, (data) ->
          items = data?.predictions or [] 
          map = {}
          objs = []
          for i in items
            objs.push i.description
            map[i.description] = i.reference
          process objs
        )
      updater: (desc) => 
        @$el.find('.placeSuggest').data('ref', map[desc])
        desc
    }

  #get the data from the form
  input: ->
    i = @$el.find('form').serializeObject()
    dateRef = @$el.find('.pickdate').data('ref')
    i.date = new Date(dateRef) if dateRef
    i.placeRef = @$el.find('.placeSuggest').data('ref')
    i

  #check if the data is valid. if not, publish an error
  isValid: ->
    i = @input()
    errs = []
    errs.push "what" unless i.title
    errs.push "where" unless i.placeRef
    errs.push "when" unless i.date
    errs.push "image" unless @model.get 'fileData'

    if errs.length > 0
      @alertError "Missing: #{errs.join(', ')}"
      $('html, body').animate({ scrollTop: 0 }, 1000)
      return false
    
    return true

  #do the save
  save: (e)->
    e.preventDefault()
    if @isValid()
      @toggleSave()
      @model.set(@input())
      @alertInfo "Uploading..."
      $('html, body').animate({ scrollTop: 0 }, 1000)
      @uploadImage (response) =>
        @model.set {
          imgLink: response.data.link
          imgRef: response.data.id
          imgDelete: response.data.deletehash
        }
        @model.save null, {
          success: =>
            @alertSuccess "Saved...", true
            @publishEvent '!router:routeByName', 'view', {id: @model.id}
          error: =>
            @alertError()
            @toggleSave()
        }

  uploadImage: (done) ->
    $.ajax({
      url: "https://api.imgur.com/3/image"
      type: "POST"
      headers:
        'Authorization': "Client-ID dd3300b7ef32d64"
      data:
        image: btoa(@model.get('fileData'))
        title: @model.get('title')
    })
    .success((data) ->
      done(data)
    )
    .error( => 
      @toggleSave()
      @alertError()
    )

  toggleSave: ->
    e = @$el.find('.save')
    disabled = !e.attr('disabled')
    e.attr 'disabled', disabled
    e.find('.lbl').text((if disabled then "Saving..." else "Record"))
    if disabled
      e.attr 'data-loading', "true"
    else
      e.removeAttr 'data-loading'


