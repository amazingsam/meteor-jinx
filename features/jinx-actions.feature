#Feature: Accept Jinx arguments

#As a Meteorian
#I want to be able to provide arguments
#So I have control when using Jinx Meteor

#  Background:
#    Given I start Jinx

#  Scenario:
#    When I provide arguments
#    Then Jinx should return a result

#  Scenario:
#    When I provide non-existing arguments
#    Then Jinx should return the usage content

#  Scenario:
#    When I provide not enough arguments
#    Then Jinx should return an error message and the usage content

#Feature: Execute Jinx Commands

#As a Meteorian
#I want to execute my commands using my arguments
#So my commands are mapped as actions

#  Scenario:
#    When I invoke a task
#    And provide a valid recipe
#    Then Jinx should execute this task

#  Scenario:
#    When I invoke a generator
#    And provide a valid recipe
#    Then Jinx should execute this generator

#  Scenario:
#    When I invoke a rollback
#    And I provide a valid identifier
#    Then Jinx should remove all references with this identifier


Feature: Initialize a default Jinx Meteor Workspace

As a Meteorian
I want to create a default Jinx Meteor Workspace
So I can start developing Meteor solutions

  Scenario:
    When I create a Jinx Meteor Workspace
    Then Jinx should create a project folder
    And initialize my Jinx Meteor Workspace

#Feature: Customize my Jinx Meteor Workspace

#As a Meteorian
#I want to customize my default Jinx Meteor Workspace
#So I can change the default behavior of Jinx Meteor


#Feature: Have access to a help system

#As a Meteorian
#I want to be able to find documentation
#So I have help about every component


#Feature: Update Jinx Meteor

#As a Meteorian
#I want to be able to update Jinx Meteor
#So I have the latest stable version to work with

#Feature: Undo actions

#As a Meteorian
#I want to be able to undo my actions
#So I can rollback my current actions


#Feature: Create a Jinx Meteor Workspace

#As a Meteorian
#I want to generate a Jinx Meteor Workspace
#So I have a standard directory structure to work in


#Feature: Add default packages in Jinx Meteor Workspace

#As a Meteorian
#I want Jinx to add default packages to my Jinx Meteor Workspace
#So I can save time instead of adding them myself


#Feature: Customize Jinx Meteor Structures

#As a Meteorian
#I want to create custom Jinx Meteor structure
#So I can use customized structures in my generators


#Feature: Add default files in Jinx Meteor Workspace

#As a Meteorian
#I want to generate default files inside my Jinx Meteor Workspace
#So I can save time instead of creating it myself


#Feature: Add package in Jinx Meteor Workspace

#As a Meteorian
#I want to generate a package using my parameters
#So I can add files inside this package

#Feature: Add files using parameters in Jinx Meteor Workspace

#As a Meteorian
#I want to generate files using my parameters
#So I can save time instead of creating them myself


#Feature: Add routes to Jinx Meteor Workspace

#As a Meteorian
#I want to add or append routes in my Jinx Meteor Workspace
#So I can save time instead of creating them myself


#Feature: Add collections to Jinx Meteor Workspace

#As a Meteorian
#I want to add or append collections in my Jinx Meteor Workspace
#So I can save time instead of creating them myself


#Feature: Add stylesheets to Jinx Meteor Workspace

#As a Meteorian
#I want to add or append stylesheets in my Jinx Meteor Workspace
#So I can save time instead of creating them myself


#Feature: Scaffold pages based on parameters in Jinx Meteor Workspace

#As a Meteorian
#I want to generate a page scaffold using my parameters
#So I can save time instead of creating it myself


#Feature: Add isomorphic scripts to Jinx Meteor Workspace

#As a Meteorian
#I want to generate an isomorphic script in my Jinx Meteor Workspace
#So I can save time instead of creating it myself


#Feature: Add client scripts to Jinx Meteor Workspace

#As a Meteorian
#I want to generate a client script in my Jinx Meteor Workspace
#So I can save time instead of creating it myself


#Feature: Add server script to Jinx Meteor Workspace

#As a Meteorian
#I want to generate a server script in my Jinx Meteor Workspace
#So I can save time instead of creating it myself


#Feature: Add private script to Jinx Meteor Workspace

#As a Meteorian
#I want to generate a private script in my Jinx Meteor Workspace
#So I can save time instead of creating it myself


#Feature: Scaffold a form based on parameters in Jinx Meteor Workspace

#As a Meteorian
#I want to generate a form scaffold using my parameters
#So I can save time instead of creating it myself


#Feature: Add feature to Jinx Meteor Workspace

#As a Meteorian
#I want to generate a feature
#So I start do test driven development


#Feature: Select deployment stage

#As a Meteorian
#I want to select my deployment stage
#So I can save time instead of moving it myself


#Feature: Compile the Jinx Meteor Workspace

#As a Meteorian
#I want to compile my project files
#So I have a pre-production version of my project


#Feature: Build the Meteor project

#As a Meteorian
#I want to build my Meteor project
#So I have a final version of my project
