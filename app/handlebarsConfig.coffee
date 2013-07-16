Handlebars.registerHelper "dateFormat", (date) ->
  return '' unless date
  date = Date.parseIso8601(date) if _.isString date
  moment(date).format 'dddd MMMM Do, YYYY'
