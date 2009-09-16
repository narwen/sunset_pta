Feature: Authorized user invites volunteer to become active user
  In order to add users
  As an authorized user
  I want to invite volunteers to become active users
@focus
  Scenario: Admin invites a volunteer
    Given I am logged in as "bob@example.com"
    And I have the role "admin"
    And there is a user "becky@gmail.com"
    And "becky@gmail.com" is inactive
    When I am on the profile page for "becky@gmail.com"
    Then I should see "Send Email Invitation"
    When I follow "Send Email Invitation"
    Then I should see "Invitation sent."
    And "becky@gmail.com" should receive 1 email
    When "becky@gmail.com" opens the email
    Then they should see "You've been invited" in the email body
    When they follow "Click here to activate your account!" in the email
  # 
  # Scenario: Board Member invites a volunteer
  #   Given I am logged in as "bob@example.com"
  #   And I have the role "board_member"
  #   And there is a non-user volunteer with first name "Becky"
  #   And I am on the profile page for volunteer with first name "Becky"
  #   Then I should see "Send Email Invitation"
  #   
  # Scenario: Non-authorized user fails to invite a volunteer
  #   Given I am logged in as "bob@example.com"
  #   And I do not have the role "admin"
  #   And I do not have the role "board_member"
  #   And there is a non-user volunteer with first name "Becky"
  #   And I am on the profile page for volunteer with first name "Becky"
  #   Then I should not see "Send Email Invitation"
