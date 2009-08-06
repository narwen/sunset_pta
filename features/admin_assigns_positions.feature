Feature: Admin assigns executive board positions
  In order to track the board members
  As an admin
  I want to assign users to board positions

  Scenario: Admin assigns a user to a position
    Given I am logged in as "admin@example.com"
    And I have the role "admin"
    And there is a user "president@example.com"
    And there is a position "President"
    When I go to the profile page for "president@example.com"
    And I follow "Edit"
    And I select "President" from "Board position"
    And I press "Save"
    Then I should see "User updated successfully"
    And I should see "President"
