View = require 'views/base/view'
template = require 'views/templates/image'

module.exports = class ImageView extends View
  template: template
  
  listen:
    'change:fileData model' : 'render'
  
  events:
    'click .showDialog' : 'showDialog'
    'click .clear' : 'clear'
    'change input' : 'loadFile'

  showDialog: (e) ->
    @$el.find('.fileInput').click()

  clear: (e) ->
    @model.set({fileData:null})

  loadFile: (e) ->
    f = e.currentTarget.files?[0]
    console.log f
    if f
      @type = f.type
      reader = new FileReader()
      reader.onload = (e) =>
        @model.set('fileData', reader.result)
      reader.onerror = =>
        @publishEvent 'alert', {type: 'alert-error', message: 'Error loading file...'}
      reader.readAsBinaryString(f)

  getTemplateData: ->
    td = super
    td.src = "data:#{@type};base64,#{btoa(td.fileData)}" if td.fileData 
    td