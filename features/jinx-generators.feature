Feature: Generate a default Meteor Workspace

As a Meteorian
I want to generate a default Meteor Workspace
So I have a standard directory structure to work in

  Scenario:
    Given a default structure is defined
    And no custom directive is provided
    Then the standard directory structure should be generated

Feature: Generate a custom Meteor Workspace

As a Meteorian
I want to specify a custom Meteor Workspace
So I have a custom, yet predefined directory structure to work in

  Scenario:
    Given a custom structure is defined
    And a custom directive is provided
    Then the custom directory structure should be generated
