exports.config =
  modules:
    wrapper: false
  paths:
    public: './dist'
  conventions:
    assets: /^app\/assets/
  files:
    javascripts:
      joinTo:
        'js/widget.js': /^(app|bower_components)/
        'test/tests.js': /^test/
      order:
        after: [
          'app/scripts/**/*.coffee'
          'app/**/*.coffee'
        ]
    stylesheets:
      joinTo:
        'css/widget.css': /.*/
    templates:
      joinTo:
        'js/widget.js': /^app/
      order:
        after: [
          'app/**/*.jade'
        ]

  plugins:
    ng_annotate:
      pattern: /^app/
    angularTemplate:
      moduleName: 'widget'
      pathToSrc: (old)->
        old.replace(/\.jade$/, '')
      ignore: [/^.*\.static\.jade/]
    jadePages:
      destination: (path) ->
        path.replace /^(.*)\.static\.jade$/, '$1.html'
      pattern: /^.*\.static\.jade/
      jade:
        pretty: true
