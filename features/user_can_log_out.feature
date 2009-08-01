@focus
Feature: User Can Log Out
  In order to use the website
  As a user
  I want to be able to log out

  Scenario: Successful Log Out
    Given there is no registered user "harold@example.com" with password "secret"
    And I am on the login page
    When I fill in "Email" with "harold@example.com"
    And I fill in "Password" with "secret"
    And I press "Login"
    Then I should not see "Login successful!"
