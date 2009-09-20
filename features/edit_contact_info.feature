Feature: Edit contact info
  In order to share my contact info with other PTA members
  As a PTA member
  I want to edit my contact info

  Scenario: Fill in all my contact info
    Given I am logged in as "bob@example.com"
    And I am on the homepage
    When I follow "My contact info"
    And I follow "Edit"
    And I fill in the following fields:
      | field      | value                      |
      | First Name | Bob                        |
      | Last Name  | Bobson                     |
      | Email      | bobs.new.email@example.com |
      | Address    | 3333 Example St            |
      | Home Phone | 222-333-4444               |
      | Cell Phone | 444-555-6666               |
    And I press "Save"
    Then I should see "User updated successfully"
    And I should see "Bob Bobson"
    And I should see "bobs.new.email@example.com"
    And I should see "3333 Example St"
    And I should see "222-333-4444"
    And I should see "444-555-6666"

  Scenario Outline: Admins and board members can edit anyone's contact info
    Given I am logged in as "superuser@example.com"
    And I have the <role type> "<role title>"
    And there is a user "bob@example.com"
    When I go to the profile page for "bob@example.com"
    And I follow "Edit"
    And I fill in "first name" with "Bob"
    And I fill in "last name" with "Bobson"
    And I press "Save"
    Then I should see "User updated successfully"

    Examples:
      | role type | role title |
      | role      | admin      |
      | position  | President  |

  Scenario: Normal users cannot edit others' contact info
    Given I am logged in as "bob@example.com"
    And there is a user "sally@example.com"
    When I go to the profile page for "sally@example.com"
    Then I should not see "Edit"
    
