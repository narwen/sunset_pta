@proposed
Feature: Manage Teachers for a Room in a School Year
  In order to allow admins to manage teacher and room/school year associations
  As an admin
  I want to create and manage teachers for a room in a school year

  Scenario:  Teacher list on page for room R in year Y
    Given I have teachers "May Wilson" and "Brian Litwak" in room 10A in year 2009-2010
    And I am on room info page for room 10A in year 2009-2010
    Then I should see "May Wilson" with "Delete" button # and contact info
    And I should see "Brian Litwak" with "Delete" button # and contact info
    And I should see "Add teacher"

  Scenario: Add teacher to room R in year Y
    Given I have no teachers in room 10A in year 2009-2010  # Variation: have some teachers
    And I am on room info page for room 10A in year 2009-2010  # Variation: and 
    When I follow "New Teacher"

  Scenario: Existing list of teachers
    Given I have teachers "May Wilson" and "Brian Litwak" in general teachers list
    Then I should see "May Wilson" in drop down list of teachers
    And I should see "Brian Litwak" in drop down list of teachers
    And I select "May Wilson"
    And I press "Save"  # Variation: Cancel
    Then I should see "Teacher added"
    And I should see "May Wilson" in teachers list for room 10A in year 2009-2010 # and contact info

  Scenario: Delete Teacher from room R in year Y
    Given that I have teacher "May Wilson" in room 10A in year 2009-2010
    And I am on room info page for room 10A in year 2009-2010
    When I press "Delete" next to "May Wilson"
    And I press "Save"  # Variation: press "Cancel"
    Then I should see "Delete successful."
    And I should not see "May Wilson"
    And I should see 1 less teacher in room info page for room 10A in year 2009-2010
