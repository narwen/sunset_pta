Feature: Authorized user invites volunteer to become user
  In order to add users
  As an authorized user
  I want to invite volunteers to become users

  Scenario: Admin invites a volunteer
    Given I am logged in as "bob@example.com"
    And I have the role "admin"
    And there is a non-user volunteer with first name "Becky"
    And I am on the profile page for volunteer with first name "Becky"
    Then I should see "Send Email Invitation"

  Scenario: Board Member invites a volunteer
    Given I am logged in as "bob@example.com"
    And I have the role "board_member"
    And there is a non-user volunteer with first name "Becky"
    And I am on the profile page for volunteer with first name "Becky"
    Then I should see "Send Email Invitation"
    
  Scenario: Non-authorized user fails to invite a volunteer
    Given I am logged in as "bob@example.com"
    And I do not have the role "admin"
    And I do not have the role "board_member"
    And there is a non-user volunteer with first name "Becky"
    And I am on the profile page for volunteer with first name "Becky"
    Then I should not see "Send Email Invitation"
    