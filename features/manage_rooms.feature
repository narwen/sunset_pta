@proposed
Feature: Manage Rooms (Just the Rooms Themselves)
  In order to allow users to manage school contact data
  As an admin
  I want to create and manage rooms

  Scenario: Room List
    Given I have rooms "10B" and "10A"
    And I am on list of rooms
    Then I should see "10A" with "Update" and "Delete" buttons
    And I should see "10B" with "Update" and "Delete" buttons
    And I should see "Create Room"

  Scenario: Create room
    Given I have no rooms  # Variation: have some rooms
    And I am on list of rooms  # Variation: And "100B" is already in list
    When I follow "New Room"
    And I fill in "100B"
    And I press "Create Room"
    Then I should see "New room created"
    And I should see "100B" in list of rooms

  Scenario: Update Room  # Used mainly to handle mistakes in naming rooms
    Given I have a room "100B"
    And I am on list of rooms
    When I press "Update" next to "100B"
    And I replace "100B" with "10B"
    And I press "Save"  # Variation: press "Cancel"
    Then I should see "Update successful."
    And I should see "10B"

  Scenario: Delete Room  # Used mainly to handle mistakes in creating rooms
    Given that I have room "Extra"
    And I am on list of rooms
    When I press "Delete" next to "Extra"
    And I press "Save"  # Variation: press "Cancel"
    Then I should see "Delete successful."
    And I should not see "Extra"
    And I should see 1 less room in the list of rooms
