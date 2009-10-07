#!/usr/bin/env cucumber
Feature: User Can Log Out
  In order to use the website
  As a user
  I want to be able to log out

  Scenario: Successful Log Out
    Given I am logged in as "bob@example.com"
    And I am on the homepage
    When I follow "Logout"
    Then I should see "Logout successful!"