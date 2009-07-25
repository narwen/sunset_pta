@focus
Feature: User Can Log In
  In order to allow people to use the site
  As a user
  I want to be able to log in

  Scenario: Successful Login
    Given I am registered user "Harold" with password "secret"
    And I am on the login page
    When I fill in "Login" with "Harold"
    And I fill in "Password" with "secret"
    And I press "Login"
    Then I should see "Login successful!"
    