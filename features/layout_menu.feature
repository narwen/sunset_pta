#!/usr/bin/env cucumber
Feature: Layout menu
  In order to navigate in the application
  As a volunteer
  I want to have access to a central menu
  
  Scenario: Admin logs in and sees the main menu
    Given I am logged in as "bob@example.com"
    And my name is "Bob Bobson"
    And I have the role "admin"
    When I go to the homepage
    Then I should see "Bob Bobson"
    And I should see "Logout"
    And I should see "Board Members"
    And I should see "Volunteers"
    And I should see "Committees"
    And I should see "Positions"

  Scenario: Board member logs in and sees the main menu
    Given I am logged in as "bob@example.com"
    And my name is "Bob Bobson"
    And I have the role "admin"
    When I go to the homepage
    Then I should see "Bob Bobson"
    And I should see "Logout"
    And I should see "Board Members"
    And I should see "Volunteers"
    And I should see "Committees"
    And I should see "Positions"

  Scenario: Volunteer logs in and sees the main menu
    Given I am logged in as "bob@example.com"
    And my name is "Bob Bobson"
    And I do not have the role "admin"
    And I do not have the role "board_member"
    When I go to the homepage
    Then I should see "Bob Bobson"
    And I should see "Logout"
    And I should see "Board Members"
    And I should see "Volunteers"
    And I should see "Committees"
    And I should not see "Positions"
