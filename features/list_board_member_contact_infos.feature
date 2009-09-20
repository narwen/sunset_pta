Feature: List board members with contact info
  In order to have a page that displays board members and their contact info
  As an authenticated user
  I want to list each board member with position, first_name, last_name and email
  
  Scenario: List the board members alongwith the contact info
    Given the following users exist:
      | first_name | last_name | email             | position_title |
      | Bob        | Bobson    | bob@example.com   | President      |
      | Sally      | Sallyson  | sally@example.com | Treasurer      |
      | Frank      | Frankson  | frank@example.com |                |
    And I am logged in as "jack@example.com"
    And I am on the homepage
    When I follow "Board Members"
    Then I should see "Bob Bobson"
    And I should see "President"
    And I should see "bob@example.com"
    And I should see "Sally Sallyson"
    And I should see "Treasurer"
    And I should see "sally@example.com"
    And I should not see "Frank Frankson"

