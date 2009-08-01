Feature: Positions are unique
  In order to remain sane
  As a user
  I want to make sure duplicates are not allowed for positions

  Scenario: User tries to add existing position
    Given I am logged in as registered user "bobby@gmail.com"
    And I have the role "admin"
    And I am on the new position page
    And there already exists a position with title "Secretary"
    When I fill in "title" with "Secretary"
    And I press "Create"
    Then I should see "taken"
  
  
