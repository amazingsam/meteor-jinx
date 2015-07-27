
module.exports = ->

  Jinx = require('../../lib/jinx-core')

  # Feature: Accept Jinx arguments (finished -- all passed )

  # @Given /^I start Jinx$/, (callback) ->
  #   # Jinx.start()
  #   callback()
  #
  # @When /^I provide arguments$/, (callback) ->
  #   Jinx.start(['generate', 'page', 'hello'])
  #   Jinx.reset()
  #   callback()
  #
  # @Then /^Jinx should return a result$/, (callback) ->
  #   Jinx.start(['generate', 'page', 'hello'])
  #   Jinx.preprocess()
  #   Jinx.reset()
  #   callback()
  #
  # @Then /^Jinx should return the usage content$/, (callback) ->
  #   Jinx.usage()
  #   callback()
  #
  # @When /^I provide not enough arguments$/, (callback) ->
  #   Jinx.start(['generate', 'page'])
  #   Jinx.preprocess()
  #   Jinx.reset()
  #   callback()
  #
  # @Then /^Jinx should return an error message and the usage content$/, (callback) ->
  #   Jinx.start(['generate', 'page'])
  #   Jinx.preprocess()
  #   Jinx.reset()
  #   callback()
  #
  # @When /^I provide non\-existing arguments$/, (callback) ->
  #   Jinx.start(['g3n3rate', 'b', 'customName'])
  #   Jinx.preprocess()
  #   Jinx.validate()
  #   Jinx.reset()
  #   callback()

  # Feature: Execute Jinx Commands

  # @When /^I invoke a task$/, (callback) ->
  #   Jinx.start(['create', 'structure-sm', 'hello'])
  #   Jinx.preprocess()
  #   Jinx.validate()
  #   Jinx.reset()
  #   callback()
  #
  # @When /^provide a valid recipe$/, (callback) ->
  #   Jinx.start(['create', 'structure-sm', 'hello'])
  #   Jinx.preprocess()
  #   Jinx.validate()
  #   Jinx.reset()
  #   callback()
  #
  # @Then /^Jinx should execute this task$/, (callback) ->
  #   Jinx.start(['create', 'structure-sm', 'hello'])
  #   Jinx.preprocess()
  #   Jinx.validate()
  #   Jinx.execute()
  #   Jinx.reset()
  #   callback()
  #
  # @When /^I invoke a generator$/, (callback) ->
  #   Jinx.start(['generate', 'blaze', 'mytest'])
  #   Jinx.preprocess()
  #   Jinx.validate()
  #   Jinx.execute()
  #   Jinx.reset()
  #   callback()
  #
  # @Then /^Jinx should execute this generator$/, (callback) ->
  #   Jinx.start(['generate', 'blaze', 'mytest'])
  #   Jinx.preprocess()
  #   Jinx.validate()
  #   Jinx.execute()
  #   Jinx.reset()
  #   callback()

  # @When /^I invoke a rollback$/, (callback) ->
  #   # Write code here that turns the phrase above into concrete actions
  #   callback.pending()
  #
  # @When /^I provide a valid identifier$/, (callback) ->
  #   # Write code here that turns the phrase above into concrete actions
  #   callback.pending()
  #
  # @Then /^Jinx should remove all references with this identifier$/, (callback) ->
  #   # Write code here that turns the phrase above into concrete actions
  #   callback.pending()

  # Feature: Initialize a default Jinx Meteor Workspace

  @When /^I create a Jinx Meteor Workspace$/, (callback) ->

    # Jinx.start(['create', 'workspace', 'myapp'])
    # Jinx.preprocess()
    # Jinx.validate()
    # Jinx.execute()
    # Jinx.reset()
    callback()

  @Then /^Jinx should create a project folder$/, (callback) ->
    # Jinx.start(['create', 'workspace', 'myotherapp'])
    # Jinx.preprocess()
    # Jinx.validate()
    # Jinx.execute()
    # Jinx.reset()
    callback()

  @Then /^initialize my Jinx Meteor Workspace$/, (callback) ->
    # Jinx.start(['create', 'workspace', 'myotherapp'])
    # Jinx.preprocess()
    # Jinx.validate()
    # Jinx.execute()
    Jinx.createMeteorProject({ 'target' : 'myotherapp'})
    # Jinx.reset()
    callback.pending()
