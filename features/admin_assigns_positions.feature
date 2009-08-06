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

  Scenario: Admin assigns a user to a filled position, demoting the previous holder
    Given I am logged in as "admin@example.com"
    And I have the role "admin"
    And there are users "old.president@example.com", "new.president@example.com"
    And "old.president@example.com" has the position "President"
    When I go to the profile page for "new.president@example.com"
    And I follow "Edit"
    And I select "President" from "Board position"
    And I press "Save"
    Then I should be on the profile page for "new.president@example.com"
    And I should see "President"
    When I go to the profile page for "old.president@example.com"
    Then I should not see "President"
