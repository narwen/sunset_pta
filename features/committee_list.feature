Feature: Only admins can add/delete committees
  In order to keep a record of committees
  As an administrator
  I want to add and delete committees

  Scenario: Admin can add a committee
    Given I am logged in as "admin@sunset-pta.com"
    And I have the role "admin"
    When I follow "Committees"
    And I follow "New committee"
    And I fill in "Name" with "Publicity"
    And I press "Create"
    Then I should see "Committee was successfully created."
    And I should see "Publicity"

  Scenario: Non admin fails to add a committee
    Given I am logged in as "grace@gmail.com"
    And I do not have the role "admin"
    When I go to the new committee page
    Then I should see "Permission Denied!"
    
  Scenario: Admin can delete a committee
    Given I am logged in as "admin@sunset-pta.com"
    And I have the role "admin"
    And there is a committee "Publicity"
    When I follow "Committees"
    Then I should see /Publicity[\s,A-z,a-z]+Delete/
    When I follow "Delete"
    Then I should not see "Publicity"
    
  Scenario: Non admin fails to delete a committee
    Given I am logged in as "admin@sunset-pta.com"
    And I do not have the role "admin"
    And there is a committee "Publicity"
    When I follow "Committees"
    Then I should see "Publicity"
    And I should not see /Publicity[\s,A-z,a-z]+Delete/

  Scenario: Admin can edit a committee
    Given I am logged in as "admin@sunset-pta.com"
    And I have the role "admin"
    And there is a committee "Springg Festval"
    When I follow "Committees"
    Then I should see /Springg Festval[\s,A-z,a-z]+Edit[\s,A-z,a-z]+/
    When I follow "Edit"
    And I fill in "name" with "Spring Festival"
    And I press "Update"
    Then I should see "Committee was successfully updated."
    And I should see "Spring Festival"

  Scenario: Non admin fails to edit a committee
    Given I am logged in as "admin@sunset-pta.com"
    And I do not have the role "admin"
    And there is a committee "Springg Festval"
    When I follow "Committees"
    Then I should see "Springg Festval"
    And I should not see /Springg Festval[\s,A-z,a-z]+Edit[\s,A-z,a-z]+/

  Scenario: Deleting a committee deletes its assignments
    Given I am logged in as "admin@sunset-pta.com"
    And I have the role "admin"
    And there is a committee "Publicity"
    And there is a user "liah@gmail.com"
    And "liah@gmail.com" is assigned to "Publicity" as "Chair"
    When I go to the profile page for "liah@gmail.com"
    And I follow "View Committee Assignments"
    Then I should see /Publicity\s+Chair/
    When I follow "Committees"
    Then I should see /Publicity[\s,A-z,a-z]+Delete/
    When I follow "Delete"
    Then I should not see "Publicity"
    When I go to the profile page for "liah@gmail.com"
    And I follow "View Committee Assignments"
    Then I should not see /Publicity\s+Chair/

 