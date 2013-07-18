express = require 'express'
path = require 'path'
 
app = express()
 
app.configure ->
  app.use express.static(__dirname + '/public')

app.all '*', (request, response) ->
  response.sendfile './public/index.html'

 
port = process.env.PORT || port
console.log "startServer on #{port}"
app.listen port
