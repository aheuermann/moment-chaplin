console.log "app node file", process.cwd()
 
express = require 'express'
path = require 'path'
 
app = express()
 
app.configure ->
  app.use express.static(__dirname + '/public')

app.all '*', (request, response) ->
  response.sendfile './public/index.html'

 
exports.startServer = (port, path, callback) ->
  p = process.env.PORT || port
  console.log "startServer on port: #{p}, path #{path}"
  app.listen p
 
isHeroku = true
console.log isHeroku
if isHeroku
  exports.startServer()
