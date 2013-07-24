Handlebars.registerHelper "dateFormat", (date) ->
  return '' unless date
  moment(date).format 'dddd MMMM Do, YYYY'
