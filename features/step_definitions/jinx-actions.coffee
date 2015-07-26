
module.exports = ->

  Jinx = require('../../lib/jinx-core')

  @Given /^I start Jinx$/, (callback) ->
    # Jinx.start()
    callback()

  @When /^I provide arguments$/, (callback) ->
    Jinx.start(['generate', 'page', 'hello'])
    Jinx.reset()
    callback()

  @Then /^Jinx should return a result$/, (callback) ->
    Jinx.start(['generate', 'page', 'hello'])
    Jinx.preprocess()
    Jinx.reset()
    callback()

  @Then /^Jinx should return the usage content$/, (callback) ->
    Jinx.usage()
    callback()

  @When /^I provide not enough arguments$/, (callback) ->
    Jinx.start(['generate', 'page'])
    Jinx.preprocess()
    Jinx.reset()
    callback()

  @Then /^Jinx should return an error message and the usage content$/, (callback) ->
    Jinx.start(['generate', 'page'])
    Jinx.preprocess()
    Jinx.reset()
    callback()

  @When /^I provide non\-existing arguments$/, (callback) ->
    Jinx.start(['g3n3rate', 'b', 'customName'])
    Jinx.preprocess()
    Jinx.validate()
    Jinx.reset()
    callback()
