Feature: Add/delete committee volunteers
  In order to keep a record of committee volunteers for committees
  As an administrator or board member
  I want to add and delete volunteers from committees

Scenario: Admin can add a committee volunteer
    Given I am logged in as "admin@sunset-pta.com"
    And I have the role "admin"
    And there is a committee "Xmas"
    And there is a user "chris@gmail.com"
    When I go to the profile page for "chris@gmail.com"
    And I follow "View Committee Assignments"
    And I follow "Add Committee Assignment"
    And I select "Xmas" from "Committee"
    And I select "Volunteer" from "Duty"
    And I press "Create Committee Assignment"
    Then I should see "Committee assignment was successfully created"
    And I should see /Xmas\s+Volunteer/


Scenario: Board member can add a committee volunteer
    Given I am logged in as "sarah@sunset-pta.com"
    And I have the role "board_member"
    And there is a committee "Halloween"
    And there is a user "tom@gmail.com"
    When I go to the profile page for "tom@gmail.com"
    And I follow "View Committee Assignments"
    And I follow "Add Committee Assignment"
    And I select "Halloween" from "Committee"
    And I select "Volunteer" from "Duty"
    And I press "Create Committee Assignment"
    Then I should see "Committee assignment was successfully created"
    And I should see /Halloween\s+Volunteer/

 Scenario: Non admin, non board member fails to add a volunteer
    Given I am logged in as "rupak@sunset-pta.com"
    And I do not have the role "admin"
    And I do not have the role "board_member"
    And there is a user "petros@gmail.com"
    When I go to the profile page for "petros@gmail.com"
    And I follow "View Committee Assignments"
    Then I should not see "Add Committee Assignment"
    And I go to the new user assignment page for "petros@gmail.com"
    Then I should see "Permission Denied!"

Scenario: Admin can delete a committee volunteer
    Given I am logged in as "admin@sunset-pta.com"
    And I have the role "admin"
    And there is a committee "Xmas"
    And there is a user "chris@gmail.com"
    And "chris@gmail.com" is assigned to "Xmas" as "Volunteer"
    When I go to the profile page for "chris@gmail.com"
    And I follow "View Committee Assignments"
    Then I should see /Xmas\s+Volunteer[\s,A-Z,a-z]+Delete/
    And I follow "Delete"
    Then I should not see /Xmas\s+Volunteer/

Scenario: Board member can delete a committee volunteer
    Given I am logged in as "sarah@sunset-pta.com"
    And I have the role "board_member"
    And there is a committee "Halloween"
    And there is a user "tom@gmail.com" 
    And "tom@gmail.com" is assigned to "Halloween" as "Volunteer"
    When I go to the profile page for "tom@gmail.com"
    And I follow "View Committee Assignments"
    Then I should see /Halloween\s+Volunteer[\s,A-Z,a-z]+Delete/
    And I follow "Delete"
    Then I should not see /Halloween\s+Volunteer/

Scenario: Non admin, non board member fails to delete a committee chair
    Given I am logged in as "rupak@sunset-pta.com"
    And I do not have the role "admin"
    And I do not have the role "board_member"
    And there is a committee "Tech"
    And there is a user "petros@gmail.com"
    And "petros@gmail.com" is assigned to "Tech" as "Volunteer"
    When I go to the profile page for "petros@gmail.com"
    And I follow "View Committee Assignments"
    Then I should see /Tech\s+Volunteer/
    And I should not see /Tech\s+Volunteer[\s,A-Z,a-z]+Delete/



