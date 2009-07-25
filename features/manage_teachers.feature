@proposed
Feature: Manage Teachers
  In order to allow admins to manage teacher contact data
  As an admin
  I want to create and manage teachers

  Scenario: Teacher List
    Given I have teachers "May Wilson" and "Brian Litwak"
    And I am on list of teachers
    Then I should see "May Wilson" with "Update" and "Delete" buttons
    And I should see "Brian Litwak" with "Update" and "Delete" buttons
    And I should see "Create Teacher"

  Scenario: Add teacher
    Given I have no teachers  # Variation: have some rooms
    And I am on list of teachers  # Variation: And "May Wilson" is already in list
    When I follow "New Teacher"
    And I fill in First Name with "May"
    And I fill in Last Name with "Wilson"
    And I fill in Phone Number with "415-555-1234"
    And I fill in Email with "maywilson@gmail.com"
    And I press "Create"
    Then I should see "New teacher created"
    And I should see "May Wilson" in list of teachers

  Scenario: Read teacher
    Given I have Teacher "May Wilson" # add checks for field info
    And I am on list of teachers
    When I follow "May Wilson"
    Then I should see "First Name: May"
    And I should see "Last Name: Wilson"
    And I should see "Phone Number: 415-555-1234"
    And I should see "Email: maywilson@gmail.com"

  Scenario: Update Teacher
    Given I am on read teacher page for teacher "May Wilson"
    When I follow "Update"
    And I replace Phone Number from "415-555-1234" to "510-555-3456"
    And I replace Email from "maywilson@gmail.com" to "mwilson@yahoo.com"
    And I press "Save"  # Variation: press "Cancel"
    Then I should see "Teacher updated"
    And I should see "Phone Number: 510-555-3456"
    And I should see "Email: mwilson@yahoo.com"

  Scenario: Delete Teacher  
    Given that I have teacher "May Wilson"
    And I am on list of teachers  # Variation: on Read teacher page
    When I press "Delete" next to "May Wilson"
    And I press "Save"  # Variation: press "Cancel"
    Then I should see "Delete successful."
    And I should not see "May Wilson"
    And I should see 1 less teacher in the list of rooms
