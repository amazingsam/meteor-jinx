# import configuration, dependencies
inDevMode = true
jinxUserparams = ['nodejs', 'jinx']
jinxConfig = require('./config/jinx-config.json')
jinxCommands = require('./config/jinx-commands.json')
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

  usage: ->
    @jout "usage: jinx <generate|destroy> <recipe> <custom name> <target>"

  version: ->
    return "#{jinxConfig.default.version}"

  start: (args) ->
    if(args?)
      for arg in args
        jinxUserparams.push(arg)
    else
      @usage()

    return true

  reset: ->
    jinxUserparams = ['nodejs', 'jinx']

  preprocess: ->
    userparams = []
    if inDevMode
      userparams = jinxUserparams
    else
      userparams = process.argv

    if userparams.length <= 4
      @jout "error: not enough arguments."
      @usage()
    else
      JinxTask = userparams[2]
      JinxRecipe = userparams[3]
      JinxCustomName = userparams[4]
      if userparams[5]?
        JinxTarget = userparams[5]
      else
        JinxTarget = ""

      if userparams[6]?
        JinxOptions = userparams[6]
      else
        JinxOptions = ""

    return true

  validate: ->
    isValidGenerator = false
    isValidRecipe = false
    isValidTask = false

    for generator, code of jinxCommands.generators
      if generator == jinxUserparams[2]
        isValidGenerator = true

    for recipe, code of jinxCommands.recipes
      if recipe == jinxUserparams[3]
        isValidRecipe = true

    for task, code of jinxCommands.tasks
      if task == jinxUserparams[2]
        isValidTask = true

    if isValidGenerator
      if isValidRecipe
        return true
      else
        @jout "the argument #{jinxUserparams[3]} is not a valid recipe. "
        @usage()
        return false
    else
      if isValidTask
        return true
      else
        @jout "the argument #{jinxUserparams[2]} is not a valid command."
        @usage()
        return false



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
