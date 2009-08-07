
Feature: Admin can edit positions
  In order to keep a record of who is in which position
  As an administrator
  I want to add, edit and delete positions

  Scenario: Admin adds a position
    Given I am logged in as "bob@example.com"
    And I have the role "admin"
    And I am on the new position page
    When I fill in "title" with "Secretary"
    And I press "Create"
    Then I should see "Position Secretary Added Successfully"

  Scenario: Non admin cannot add a position
    Given I am logged in as "bob@example.com"
    And I do not have the role "admin"
    And I am on the new position page
    Then I should not see "Create"

  Scenario: User fails to add existing position
    Given I am logged in as "bob@example.com"
    And I have the role "admin"
    And I am on the new position page
    And there is a position "Secretary"
    When I fill in "title" with "Secretary"
    And I press "Create"
    Then I should see "taken"
    
  Scenario: Admin deletes a position
    Given I am logged in as "bob@example.com"
    And I have the role "admin"
    And there is a position "Secretary"
    And I go to the positions page
    When I follow "Delete Secretary" 
    Then I should not see "Secretary"