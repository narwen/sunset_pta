Feature: Authorized user invites volunteer to become active user
  In order to add users
  As an authorized user
  I want to invite volunteers to become active users
@focus
  Scenario: Admin invites a volunteer
    Given I am logged in as "bob@example.com"
    And I have the role "admin"
    And there is a non-user volunteer with first name "Becky"
    When I am on the profile page for volunteer with first name "Becky"
    Then I should see "Send Email Invitation"
    When I follow "Send Email Invitation"
    Then I should see "Invitation sent."
    # And volunteer with first name "Becky" should have 1 email

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
