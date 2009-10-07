#!/usr/bin/env cucumber
Feature: User Can Log In
  In order to allow people to use the site
  As a user
  I want to be able to log in

  Scenario: Successful Login
    Given there is a user "harold@example.com" with password "secret"
    When I go to the homepage
    And I follow "Login"
    And I fill in "Email" with "harold@example.com"
    And I fill in "Password" with "secret"
    And I press "Login"
    Then I should see "Login successful!"