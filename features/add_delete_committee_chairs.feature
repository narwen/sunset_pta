Feature: Add/delete committee chairs
  In order to keep a record of committee chairs for committees and manage permissions for committee chairs
  As an administrator or board member
  I want to add and delete committee chairs from committees

Scenario: Admin can add a committee chair
    Given I am logged in as "admin@sunset-pta.com"
    And I have the role "admin"
    And there is a committee "Events"
    And there is a user "chris@gmail.com"
    When I go to the profile page for "chris@gmail.com"
    And I follow "Add as committee chair"
    And I select "Events" from "Committee"
    And I press "Save"
    Then I should see "User added as committee chair for Events committee successfully"

