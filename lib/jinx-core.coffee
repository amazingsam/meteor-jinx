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

  writefile: (path, data) ->
    try
      file = fs.openSync(path, 'w')
      fs.writeSync(file, data)
      fs.closeSync(file)
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

  # Jinx Meteor Operations

  usage: ->
    @jout "usage: jinx <task|generator> <recipe> <identifier> <target>"

  version: ->
    return "#{jinxConfig.default.version}"

  main: ->
    inDevMode = false
    @preprocess()
    @validate()
    @execute()

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
      jinxUserparams = userparams

    if userparams.length <= 4
      @jout "error: not enough arguments."
      @usage()
      process.exit()
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
        if isValidRecipe
          return true
        else
          @jout "the argument #{jinxUserparams[3]} is not a valid recipe. "
          @usage()
          return false
      else
        @jout "the argument #{jinxUserparams[2]} is not a valid command."
        @usage()
        return false

  execute: ->
    runGenerator = false
    runTask = false

    options = {}

    for task, tcode of jinxCommands.tasks
      if task == jinxUserparams[2]
        options['task'] = tcode
        runTask = true

    for generator, gcode of jinxCommands.generators
      if generator == jinxUserparams[2]
        options['generator'] = gcode
        runGenerator = true

    for recipe, rcode of jinxCommands.recipes
      if recipe == jinxUserparams[3]
        options['recipe'] = rcode

    if runGenerator
      @executeGenerator(options)

    if runTask
      @executeTask(options)

    return true

  parseRecipe: (pocket) ->

    jIdentifier = jinxUserparams[4]
    jRecipe = jinxUserparams[3]
    jData = jinxUserparams[6]

    if pocket['generate']?
      switch pocket['code']
        when 500
          tmpl = jextensions.createBlazeTemplate({ 'name' : jIdentifier })
          # @writefile("#{jIdentifier}.html", tmpl)

    if pocket['destroy']?
      switch pocket['code']
        when 500
          @jout "TODO: undo"

    if pocket['create']?
      switch pocket['code']
        when 1
          if @checkForJinx()
            @jout "Jinx already exists!"
          else
            @createJinxMeteorWorkspace({ 'structureId' : jRecipe, 'target' : jIdentifier })

        when 4001
          if @checkForJinx()
            @jout "Jinx already exists!"
          else
            @createJinxMeteorWorkspace({ 'structureId' : jRecipe, 'target' : jIdentifier })

        else
          @jout "error: invalid recipe"

    if pocket['remove']?
      switch pocket['code']
        when 4001
          @jout "TODO: undo"

  executeGenerator: (options) ->
    pocket = {}
    switch options['generator']
      when 100
        pocket["generate"] = true
        pocket["code"] = options['recipe']
      when 200
        pocket["destroy"] = true
        pocket["code"] = options['recipe']

    @parseRecipe(pocket)
    return true

  executeTask: (options)->
    pocket = {}
    switch options['task']
      when 5000
        pocket["create"] = true
        pocket["code"] = options['recipe']
      when 6000
        pocket["remove"] = true
        pocket["code"] = options['recipe']

    @parseRecipe(pocket)
    return true

  checkForMeteor: ->
    status = @exists(".meteor/versions")
    return status

  checkForJinx: ->
    status = @exists(".jinx/versions")
    return status

  createJinxMeteorWorkspace: (options) ->

    targetfolder = ""

    if(options['target']?)
      targetfolder = options['target']
      if options['target'] == "."
        targetfolder = "./"
      else
        targetfolder+= "/"
    else
      targetfolder = "./"

    workspace = @loadStructure(options['structureId'])
    @mkdir("#{targetfolder}.jinx")
    @cp("lib/recipes/core/versions", "#{targetfolder}.jinx/versions")
    @cp("lib/structures/#{options['structureId']}.json", "#{targetfolder}.jinx/structure.json")

    for folder in workspace.folders
      @mkdir "#{targetfolder}#{folder}"

    for source, target of workspace.files
      @cp("lib/recipes/#{source}", "#{targetfolder}#{target}")

    return true

  loadStructure: (structureId) ->
    try
      myStructure = require('./structures/' + structureId + '.json')
    catch e

    return myStructure
