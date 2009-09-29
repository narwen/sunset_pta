@focus
Feature: Authorized user invites inactive user (volunteer) to become active user
  In order to add users
  As an authorized user
  I want to invite volunteers to become active users

  Scenario Outline: Admin invites an inactive user to become active
    Given I am logged in as "bob@example.com"
    And I have the role "<role>"
    And there is a user "becky@gmail.com"
    And "becky@gmail.com" is inactive
    When I am on the profile page for "becky@gmail.com"
    Then I should see "Send Email Invitation"
    When I follow "Send Email Invitation"
    Then I should see "Invitation sent."
    And "becky@gmail.com" should receive 1 email
    Then I log out
    When "becky@gmail.com" opens the email with subject "You've been invited"
    And they follow "Activate!" in the email
    Then I should see "Activate your account"
    And I should see "Please enter a secure password"
    When I fill in "password" with "hamilton99"
    When I fill in "password_confirmation" with "hamilton99"
    And I press "Activate Now"
    Then I should see "Activation successful."
    And they should receive an email
    When they open the email with subject "Activation Complete"
    Then they should see "Your account has been activated" in the email body
    
      Examples:
      | role         |
      | admin        |
      | board_member |

  Scenario: Non-authorized user fails to invite a volunteer
    Given I am logged in as "bob@example.com"
    And I do not have the role "admin"
    And I do not have the role "board_member"
    And there is a user "becky@gmail.com"
    And "becky@gmail.com" is inactive
    When I am on the profile page for "becky@gmail.com"
    Then I should not see "Send Email Invitation"

  Scenario: Non-Admin board member invites an inactive user to become active
    Given I am logged in as "bob@example.com"
    And I have the role "board_member"
    And I do not have the role "admin"
    And there is a user "becky@gmail.com"
    And "becky@gmail.com" is inactive
    When I am on the profile page for "becky@gmail.com"
    Then I should see "Send Email Invitation"
    When I follow "Send Email Invitation"
    Then I should see "Invitation sent."
    And "becky@gmail.com" should receive 1 email
    Then I log out
    When "becky@gmail.com" opens the email with subject "You've been invited"
    And they follow "Activate!" in the email
    Then I should see "Activate your account"
    And I should see "Please enter a secure password"
    When I fill in "password" with "hamilton99"
    When I fill in "password_confirmation" with "hamilton99"
    And I press "Activate Now"
    Then I should see "Activation successful."
    And they should receive an email
    When they open the email with subject "Activation Complete"
    Then they should see "Your account has been activated" in the email body
