@proposed
Feature: Manage Room Parent Users
  In order to allow room parents to manage parent contact data for their room/school-year
  As an admin
  I want to create Room Parent Users

  Scenario:  Create new Room Parent User
    Given that I have no user account for real-person Ted Jones
    And Ted Jones is parent of student Kate Jones in room 10A in year 2009-2010
    And I have created room 10A and year 2009-2010 # precondition
    And Ted Jones has given me his email address tedjones@yahoo.com # precondition
    And I am on list of users page
    When I press “Create User”
    And I enter First Name: “Ted”
    And I enter Last Name: “Jones”
    And I enter Email Address: tedjones@yahoo.com
    And I select Role “Room Parent” for Room “10A” and year “2009-2010”
    Then I should see “Create User successful”
    # And Ted Jones will receive an invitation email at tedjones@yahoo.com to activate his user account and set his password.

  Scenario: Add existing Room Parent User to Room R in Year Y

  Scenario: Delete Room Parent User from room R in year Y

  Scenario: Update Room Parent
