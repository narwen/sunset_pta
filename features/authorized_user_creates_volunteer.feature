#!/usr/bin/env cucumber
Feature: Authorized user can create a volunteer
  In order to track volunteers
  As an authorized user
  I want to add volunteers to the system

  Scenario Outline: Aurhorized user creates a volunteer
    Given I am logged in as "bob@example.com"
    And I have the role "<role>"
    And I am on the new user page
    When I fill in "first name" with "Rebecca"
    And I fill in "last name" with "Wong"
    And I press "Create Volunteer"
    Then I should see "New volunteer Rebecca Wong created."
  
      Scenarios:
        | role         |
        | admin        |
        | board_member |
  
  Scenario: Non-authorized user fails to create a volunteer
    Given I am logged in as "bob@example.com"
    And I do not have the role "admin"
    And I do not have the role "board_member"
    And I go to the new user page
    Then I should see "Please login for restricted access."
    
  Scenario Outline: Authorized user fails to create volunteer with an email that's already in use
    Given I am logged in as "bob@example.com"
    And I have the role "<role>"
    And I am on the new user page
    And there is a user "becky@gmail.com"
    When I fill in "first name" with "Rebecca"
    And I fill in "last name" with "Wong"
    And I fill in "email" with "becky@gmail.com"
    And I press "Create Volunteer"
    Then I should see "Email has already been taken"
    When I fill in "email" with "<email alternative>"
    And I press "Create Volunteer"
    Then I should not see "Email has already been taken"
    And I should see "New volunteer Rebecca Wong created."

      Scenarios:
        | role         | email alternative               |
        | admin        |                                 |
        | board_member |                                 |
        | admin        | something_unlikely@gototown.com |
        | board_member | something_unlikely@gototown.com |

    Scenario: Non-admin board member adds a volunteer
      Given I am logged in as "bob@example.com"
      And I have the role "board_member"
      And I do not have the role "admin"
      And I am on the new user page
      When I fill in "first name" with "Rebecca"
      And I fill in "last name" with "Wong"
      And I press "Create Volunteer"
      Then I should see "New volunteer Rebecca Wong created."