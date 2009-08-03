Feature: Positions are unique
  In order to remain sane
  As a user
  I want to make sure duplicates are not allowed for positions

  Scenario: User tries to add existing position
    Given I am logged in as "bob@example.com"
    And I have the role "admin"
    And I am on the new position page
    And there is a position "Secretary"
    When I fill in "title" with "Secretary"
    And I press "Create"
    Then I should see "taken"
  
  
