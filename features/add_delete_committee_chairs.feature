#!/usr/bin/env cucumber
Feature: Add/delete committee chairs
  In order to keep a record of committee chairs for committees and manage permissions for committee chairs
  As an administrator or board member
  I want to add and delete committee chairs from committees

Scenario: Admin can add a committee chair, which updates corresponding permissions
    Given I am logged in as "admin@sunset-pta.com"
    And I have the role "admin"
    And there is a committee "Xmas"
    And there is a user "chris@gmail.com" with password "chrissecret"
    And "chris@gmail.com" does not have the role "admin"
    And "chris@gmail.com" does not have the role "board_member"
    When I go to the profile page for "chris@gmail.com"
    And I follow "View Committee Assignments"
    And I follow "Add Committee Assignment"
    And I select "Xmas" from "Committee"
    And I select "Chair" from "Duty"
    And I press "Create Committee Assignment"
    Then I should see "Committee assignment was successfully created"
    And I should see /Xmas\s+Chair/
    When I follow "Logout"
    And I log in as "chris@gmail.com" with password "chrissecret"
    And I go to the profile page for "chris@gmail.com"
    Then I should see "chris@gmail.com"
    When I go to the new user page
    Then I should not see "Please login for restricted access."

Scenario: Board member can add a committee chair, which updates corresponding permissions
    Given I am logged in as "sarah@sunset-pta.com"
    And I have the role "board_member"
    And there is a committee "Halloween"
    And there is a user "tom@gmail.com" with password "tomsecret"
    And "tom@gmail.com" does not have the role "admin"
    And "tom@gmail.com" does not have the role "board_member"
    When I go to the profile page for "tom@gmail.com"
    And I follow "View Committee Assignments"
    And I follow "Add Committee Assignment"
    And I select "Halloween" from "Committee"
    And I select "Chair" from "Duty"
    And I press "Create Committee Assignment"
    Then I should see "Committee assignment was successfully created"
    And I should see /Halloween\s+Chair/
    When I follow "Logout"
    And I log in as "tom@gmail.com" with password "tomsecret"
    And I go to the profile page for "tom@gmail.com"
    Then I should see "tom@gmail.com"
    When I go to the new user page
    Then I should not see "Please login for restricted access."

Scenario: Non admin, non board member fails to add a committee chair
    Given I am logged in as "rupak@sunset-pta.com"
    And I do not have the role "admin"
    And I do not have the role "board_member"
    And there is a user "petros@gmail.com"
    When I go to the profile page for "petros@gmail.com"
    And I follow "View Committee Assignments"
    Then I should not see "Add Committee Assignment"
    And I go to the new user assignment page for "petros@gmail.com"
    Then I should see "Please login for restricted access."

Scenario: Admin can delete a committee chair, which updates corresponding permissions
    Given I am logged in as "admin@sunset-pta.com"
    And I have the role "admin"
    And there is a committee "Xmas"
    And there is a user "chris@gmail.com" with password "chrissecret"
    And "chris@gmail.com" is assigned to "Xmas" as "Chair"
    When I go to the profile page for "chris@gmail.com"
    And I follow "View Committee Assignments"
    Then I should see /Xmas\s+Chair[\sA-Za-z]+Delete/
    And I follow "Delete"
    Then I should not see /Xmas\s+Chair/
    When I follow "Logout"
    And I log in as "chris@gmail.com" with password "chrissecret"
    And I go to the profile page for "chris@gmail.com"
    Then I should see "chris@gmail.com"
    When I go to the new user page
    Then I should see "Please login for restricted access."

Scenario: Board member can delete a committee chair, which updates corresponding permissions
    Given I am logged in as "sarah@sunset-pta.com"
    And I have the role "board_member"
    And there is a committee "Halloween"
    And there is a user "tom@gmail.com" with password "tomsecret"
    And "tom@gmail.com" is assigned to "Halloween" as "Chair"
    When I go to the profile page for "tom@gmail.com"
    And I follow "View Committee Assignments"
    Then I should see /Halloween\s+Chair[\sA-Za-z]+Delete/
    And I follow "Delete"
    Then I should not see /Halloween\s+Chair/
    When I follow "Logout"
    And I log in as "tom@gmail.com" with password "tomsecret"
    And I go to the profile page for "tom@gmail.com"
    Then I should see "tom@gmail.com"
    When I go to the new user page
    Then I should see "Please login for restricted access."

Scenario: Non admin, non board member fails to delete a committee chair
    Given I am logged in as "rupak@sunset-pta.com"
    And I do not have the role "admin"
    And I do not have the role "board_member"
    And there is a committee "Tech"
    And there is a user "petros@gmail.com"
    And "petros@gmail.com" is assigned to "Tech" as "Chair"
    When I go to the profile page for "petros@gmail.com"
    And I follow "View Committee Assignments"
    Then I should see /Tech\s+Chair/
    And I should not see /Tech\s+Chair[\sA-Za-z]+Delete/
