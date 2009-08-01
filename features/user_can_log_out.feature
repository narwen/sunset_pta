@focus
Feature: User Can Log Out
  In order to use the website
  As a user
  I want to be able to log out

  Scenario: Successful Log Out
<<<<<<< Updated upstream:features/user_can_log_out.feature
    Given there is no user "harold@example.com" with password "secret"
    And I am on the login page
    When I fill in "Email" with "harold@example.com"
    And I fill in "Password" with "secret"
    And I press "Login"
    Then I should not see "Login successful!"
=======
    Given I am registered user "henry@whatthe.com" with password "secret"
    And I am logged in
    And I press "Logout"
    Then I should see "Goodbye!"
>>>>>>> Stashed changes:features/user_can_log_out.feature
