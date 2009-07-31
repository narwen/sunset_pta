@focus
Feature: User Can Log Out
  In order to use the website
  As a user
  I want to be able to log out

  Scenario: Successful Log Out
    Given There is no registered user "Harold" with password "secret"
    And I am on the login page
    When I fill in "Login" with "Harold"
    And I fill in "Password" with "secret"
    And I press "Login"
    Then I should not see "Login successful!"
