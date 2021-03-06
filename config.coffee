exports.config =
# See docs at http://brunch.readthedocs.org/en/latest/config.html.
  modules:
    definition: false
    wrapper: false
  paths:
    public: 'public/browse-app/'
  conventions:
    ignored: [/\.min\.js$/ , /ui-bootstrap\.js$/]
  files:
    javascripts:
      joinTo:
        'js/browseApp.js' : /^app/
        'js/angular.js'   : /^vendor(\/|\\)angular(\/|\\)/
        'js/angularExt.js': /^vendor(\/|\\)(angular-bootstrap|angular-animate|angular-resource|angular-sanitize|angular-ui-router|angular-bindonce)(\/|\\)/
      order:
        before: [
          'app/product/productApp.js'
          'app/app.js'
        ]
        after: [

        ]
    stylesheets:
      joinTo:
        'css/app.css': /^app(\/|\\)/
        'css/bootstrap.css': /^bower_components(\/|\\)/
      order:
        after: [

        ]
    templates:
      joinTo:
        'js/browseApp.js': /^app(\/|\\)(product|common|addtocart)(\/|\\)/
  plugins:
    angular_templates:
      path_transform: (path) -> path.replace('app/', '')
      module: 'templateCache'
    uglify:
      mangle: true
      compress:
        global_defs:
          DEBUG: true
        pure_funcs: [ 'console.log' ]
    cleancss:
      keepSpecialComments: 0
      removeEmpty: true
    jshint:
      pattern: /^app(\/|\\).*\.js$/
      warnOnly: true

