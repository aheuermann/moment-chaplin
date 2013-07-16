module.exports = (match) ->
  match 'recent', 'recent#index', name: 'recent'
  match 'record', 'record#index', name: 'record'
  match 'v/:id', 'view#index', name: 'view'
  match '*anything', 'recent#redirect'
