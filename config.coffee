exports.config =
  # See http://brunch.io/#documentation for docs.
  files:
    javascripts:
      joinTo:
        'js/app.js': /^app/
        'js/vendor.js': /^vendor/
        'test/js/test.js': /^test[\\/](?!vendor)/
        'test/js/test-vendor.js': /^test[\\/](?=vendor)/
      order:
        # Files in `vendor` directories are compiled before other files
        # even if they aren't specified in order.before.
        before: [
          'vendor/js/console-polyfill.js',
          'vendor/js/jquery-1.9.1.js',
          'vendor/js/lodash-1.2.0.js',
          'vendor/js/backbone-1.0.0.js'
        ]
        after: [
          'test/vendor/js/test-helper.js'
        ]

    stylesheets:
      joinTo:
        'css/app.css': /^(app|vendor)/
        'test/css/test.css': /^test/
      order:
        after: ['vendor/css/helpers.css']

    templates:
      joinTo: 'js/app.js'
