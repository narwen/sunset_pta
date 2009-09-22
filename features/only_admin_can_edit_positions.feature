Feature: Only admin can edit positions
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

  Scenario: Non admin fails to add a position
    Given I am logged in as "bob@example.com"
    And I do not have the role "admin"
    And I go to the new position page
    Then I should see "Please login for restricted access."
  
  Scenario: Admin fails to add existing position
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
    
  Scenario: Non Admin fails to delete a position
    Given I am logged in as "bob@example.com"
    And I do not have the role "admin"
    And there is a position "Secretary"
    And I go to the positions page
    Then I should not see "Delete Secretary"

  Scenario: Admin sees link to edit a position
    Given I am logged in as "bob@example.com"
    And I have the role "admin"
    And there is a position "Secretary"
    When I go to the positions page
    Then I should see "Edit Secretary"

  Scenario: Non admin does not see link to edit a position
    Given I am logged in as "bob@example.com"
    And I do not have the role "admin"
    And there is a position "Secretary"
    When I go to the positions page
    Then I should not see "Edit Secretary"

  Scenario: Admin updates a position
    Given I am logged in as "bob@example.com"
    And I have the role "admin"
    And there is a position "Secretary"
    And I am on the positions page
    And I follow "Edit Secretary"
    And I see "Now editing position Secretary"
    And I fill in "title" with "Comptroller General"
    And I press "Update Position"
    Then I should see "Comptroller General"
    And I should not see "Secretary"
