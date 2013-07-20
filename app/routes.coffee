module.exports = (match) ->
  match 'recent', 'recent#index', name: 'recent'
  match 'record', 'record#index', name: 'record'
  match 'v/:id', 'view#index', name: 'view'
  match '', 'recent#redirect', name: 'home'
  match '*anything', 'error#404'
