Feature: Manage student info
  In order to track info about students
  As a PTA member
  I want to manage student info for parents

  Scenario: Add a couple students to a parent
    Given I am logged in as "bob@example.com"
    When I go to my profile page
    And I follow "Add Student Info"
    
    And I fill in the following fields:
      | field   | value        |
      | Name    | Sally Bobson |
      | Grade   | 3            |
      | Room    | 101          |
      | Teacher | Susan Smith  |
    And I press "Create Student"
    Then I should see "Student created successfully"
    
    And I should see "Sally Bobson"
    
    When I fill in the following fields:
      | field   | value        |
      | Name    | Bobby Bobson |
      | Grade   | 5            |
      | Room    | 303          |
      | Teacher | Joe Joeson   |
    And I press "Create Student"
    Then I should see "Student created successfully"
    
    And I should see "Sally Bobson"
    And I should see "3"
    And I should see "101"
    And I should see "Susan Smith"
    
    And I should see "Bobby Bobson"
    And I should see "5"
    And I should see "303"
    And I should see "Joe Joeson"
    
    When I follow "My contact info"
    Then I should be on my profile page
