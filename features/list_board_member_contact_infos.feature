Feature: List board members with contact info
  In order to have a page that displays board members and their contact info
  As an authenticated user
  I want to list each board member with position, first_name, last_name and email
  
  Scenario: List the board members 
    Given I am on the homepage
    And I follow "Board Members"
    And the following users exist:
      | first_name | last_name | email             |
      | Bob        | Bobson    | bob@example.com   |
      | Sally      | Sallyson  | sally@example.com |
      | Frank      | Frankson  | frank@example.com |
    And I have the following board members:
      | first_name | last_name | email             |
      | Bob        | Bobson    | bob@example.com   |
      | Sally      | Sallyson  | sally@example.com |
    Then I should see "Bob Bobson"
    And I should see "Sally Sallyson"
    And I should not see "Frank Frankson"

