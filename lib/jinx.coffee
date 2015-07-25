module.exports =

  # Easify the life with shorthands

  exists: (path) ->
    fs = require('fs')
    try
      file = fs.openSync(path, 'a');
      return true
    catch e
      return false

  cp: (source, target) ->
    fs = require('fs')
    try
      fs.writeFileSync("#{target}", fs.readFileSync("lib/recipes/#{source}"))
      return true
    catch e
      return false

  mkdir: (path, root) ->
    fs = require('fs')
    folders = path.split('/')
    folder = folders.shift()
    root = (root or '') + folder + '/'
    try
      fs.mkdirSync root
    catch e
      if !fs.statSync(root).isDirectory()
        throw new Error(e)
    !folders.length or @mkdir(folders.join('/'), root)

  jout: (message) ->
    #console.log("#{message}")

  jlog: (message) ->
    console.log("#{message}")

  jdefault: ->
    jextensions = require('./jinx-ext')
    if jextensions.loadJinxExtenstion("test")
      @jout("Plugins OK")

  jshell: (command) ->
    jshell = require('child_process').exec
    jshell(command)

  # Logic that actually do things.

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
