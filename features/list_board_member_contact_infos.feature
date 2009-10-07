#!/usr/bin/env cucumber
Feature: List board members with contact info
  In order to have a page that displays board members and their contact info
  As an authenticated user
  I want to list each board member with position, first_name, last_name email, home_phone, and cell_phone

  Scenario: List the board members alongwith the contact info
    Given the following users exist:
      | first_name | last_name | email             | position_title | home_phone   | cell_phone   |
      | Bob        | Bobson    | bob@example.com   | President      | 111-222-3333 | 222-333-4444 |
      | Sally      | Sallyson  | sally@example.com | Treasurer      | 333-444-5555 | 444-555-6666 |
      | Frank      | Frankson  | frank@example.com |                | 555-666-7777 | 666-777-8888 |

    And I am logged in as "jack@example.com"
    And I am on the homepage
    When I follow "Board Members"
    Then I should see "Bob Bobson"
    And I should see "President"
    And I should see "bob@example.com"
    And I should see "111-222-3333"
    And I should see "222-333-4444"
    And I should see "Sally Sallyson"
    And I should see "Treasurer"
    And I should see "sally@example.com"
    And I should not see "Frank Frankson"
    And I should not see "666-777-8888"

