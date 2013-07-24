exports.config =
  # See http://brunch.io/#documentation for docs.
  files:
    javascripts:
      joinTo:
        'js/app.js': /^app/
        'js/vendor.js': /^(bower_components|vendor)/
        'test/js/test.js': /^test[\\/](?!vendor)/
        'test/js/test-vendor.js': /^test[\\/](?=vendor)/
      order:
        after: ['vendor/js/bootstrap.min.js']

    stylesheets:
      joinTo:
        'css/app.css': /^(app|vendor)/
        'test/css/test.css': /^test/
      order:
        after: ['vendor/css/helpers.css']

    templates:
      joinTo: 'js/app.js'
