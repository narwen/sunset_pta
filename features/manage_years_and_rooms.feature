@proposed
Feature: Manage school years and associated rooms
  In order to allow users to manage school contact data
  As an admin
  I want to create and manage school years and associated rooms

  Scenario: School year list

  Scenario: Create school year
    Given I have a list of rooms
    And I am on list of school years
    When I follow "New School Year"
    And I fill in "2009-2010"   # only allow "YYYY-YYYY" format
    And I press "Create School Year"
    Then I should be redirected to a new school year page
    And I should see "New school year created"
    And I should see the list of rooms for that school year hyperlinked
    # So I can follow each room link and start adding e.g. teacher/parent info
    # to the room

  Scenario: Read school year
    # Should see list of rooms for that school year hyperlinked

  Scenario: Delete school year
    # Used mainly to handle mistakes in creating school year
