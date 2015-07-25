module.exports = ->

  APP_ROOT = ""

  Jinx = require(APP_ROOT + '/lib/jinx.coffee')

  @Given /^I have a Meteor Workspace$/, (callback) ->
    if(Jinx.jcheckForMeteor())
      Jinx.jout("Meteor present")
    if(Jinx.jcheckForJinx())
      Jinx.jout("Jinx present")
    callback()

  @Given /^a default structure is defined$/, (callback) ->
    myj = Jinx.jloadStructure('structure-sm')
    callback()

  @Given /^no custom directive is provided$/, (callback) ->
    Jinx.jinxMain(['new'])
    callback()

  @Then /^the standard directory structure should be generated$/, (callback) ->
    myj = Jinx.jloadStructure('structure-sm')
    Jinx.jgenerateWorkspace(myj)
    callback()

  @Given /^a custom structure is defined$/, (callback) ->
    myj = Jinx.jloadStructure('structure-xs')
    if not myj
      Jinx.jout("Custom structure does not exist.")
    callback()

  @Given /^a custom directive is provided$/, (callback) ->
    Jinx.jinxMain(['new', '-sm'])
    callback()

  @Then /^the custom directory structure should be generated$/, (callback) ->
    myj = Jinx.jloadStructure('structure-sm')
    Jinx.jgenerateWorkspace(myj)
    callback()

  @Then /^the default files should be generated$/, (callback) ->
    myj = Jinx.jloadStructure('structure-sm')
    Jinx.jgenerateDefaultFiles(myj)
    callback()
