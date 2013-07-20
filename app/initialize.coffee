Application = require 'application'
routes = require 'routes'
require 'handlebarsConfig'

# Initialize the application on DOM ready event.
$ ->
  (new Application({routes:routes}))
