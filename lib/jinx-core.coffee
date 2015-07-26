# import configuration, dependencies

jinxConfig = require('./config/jinx-config.json')
fs = require('fs')
jextensions = require('./jinx-ext')
jshell = require('child_process').exec

module.exports =

  # Standard Output Methods

  jout: (message) ->
    console.log("#{message}") if jinxConfig.default.debug

  jerr: (message) ->
    console.log("#{message}") if jinxConfig.default.errors

  jdbg: (message) ->
    console.log("#{message}")

  # Standard Filesystem Operations

  exists: (path) ->
    try
      file = fs.openSync(path, 'r');
      return true
    catch e
      return false

  cp: (source, target) ->
    try
      fs.writeFileSync("#{target}", fs.readFileSync("#{source}"))
      return true
    catch e
      return false

  mkdir: (path, root) ->
    folders = path.split('/')
    folder = folders.shift()
    root = (root or '') + folder + '/'
    try
      fs.mkdirSync root
    catch e
      if !fs.statSync(root).isDirectory()
        throw new Error(e)
    !folders.length or @mkdir(folders.join('/'), root)

  # Standard System Operations

  jshell: (command) ->
    jshell(command)

  cwd: ->
    return "#{process.cwd()}"

  # Jinx Meteor Operations

  version: ->
    return "#{jinxConfig.default.version}"

  start: (args) ->
    return true

  preprocess: (args) ->
    commands = []
    return commands

  execute: (commands) ->

    return true

  checkForMeteor: ->
    return true

  checkForJinx: ->
    return true

  createJinxMeteorWorkspace: (options) ->
    return true




  # Deprecated

  jcheckForMeteor: ->
    status = @exists('.meteor/versions')
    return status

  jcheckForJinx: ->
    status = @exists('.jinx/versions')
    return status

  jgenerateWorkspace: (workspace) ->
    @jout("Creating #{workspace.name}...")

    for structureItem in workspace.folders
      @jout(structureItem)
      @mkdir("#{structureItem}")

    @mkdir(".jinx")
    @cp("core/versions", ".jinx/versions")

  jloadStructure: (structureId) ->
    try
      jstruct = require('./structures/' + structureId + '.json')
    catch e

    return jstruct

  jgenerateDefaultFiles: (workspace) ->
    fs = require('fs')

    for source, target of workspace.files
      @jout("#{target} from lib/recipes/#{source}")
      fs.writeFileSync("#{target}", fs.readFileSync("lib/recipes/#{source}"))

  jMeteorCreate: (projectfolder) ->
    @jshell("meteor create #{projectfolder}")

  # Emulates commandline usage
  jinxMain: (args) ->
    if args?

      switch args[0]
        when 'new'
          if /-/i.test(args[1])
            switch args[1]
              when '-sm' then @jout "selected small."
              else @jout "selection unavailable."
          else
            @jout "selection unavailable."
        else @jout "Wrong arguments"

    else
      @jout("Not enough arguments")

    return
