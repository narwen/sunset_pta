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
      | field   | value                      |
      | Name    | Bob Bobson                 |
      | Email   | bobs.new.email@example.com |
      | Address | 3333 Example St            |
      | City    | Example Town               |
      | State   | TX                         |
      | Zip     | 78705                      |
    And I press "Save"
    Then I should see "Contact info updated successfully"
    And I should see "Bob Bobson"
    And I should see "bobs.new.email@example.com"
    And I should see "3333 Example St"
    And I should see "Example Town"
    And I should see "TX"
    And I should see "78705"
