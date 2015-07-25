module.exports =

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
    console.log("#{message}")

  jlog: (message) ->
    console.log("#{message}")
    # log this somewhere

  jdefault: ->
    jextensions = require('./jinx-ext')
    if jextensions.loadJinxExtenstion("test")
      @jout("Plugins OK")

  jgenerateWorkspace: (workspace) ->
    @jout("Creating #{workspace.name}...")

    for structureItem in workspace.items
      @jout(structureItem)
      @mkdir("#{structureItem}")

  jloadStructure: (structureId) ->
    try
      jstruct = require('./structures/' + structureId + '.json')
    catch e

    return jstruct

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
