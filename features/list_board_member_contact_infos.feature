#!/usr/bin/env cucumber
Feature: List board members with contact info
  In order to have a page that displays board members and their contact info
  As an authenticated user
  I want to list each board member with position, first_name, last_name, email, home_phone and cell_phone
@focus
  Scenario: List the exec board members along with the contact info
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

  Scenario: List the committee board members, ensuring unique chaired committees only
    Given I am logged in as "anybody@sunset-pta.com"
    And there is a committee "Publicity"
    And there is a committee "Xmas"
    And there is a committee "Halloween"
    And there is a committee "Tech"
    And there is a user "chris@gmail.com" with name "Chris Lerum"
    And there is a user "liah@gmail.com" with name "Liah Hansen"
    And there is a user "sarah@gmail.com" with name "Sarah Allen"
    And "chris@gmail.com" is assigned to "Publicity" as "Chair"
    And "liah@gmail.com" is assigned to "Xmas" as "Chair"
    And "liah@gmail.com" is assigned to "Halloween" as "Volunteer"
    And "sarah@gmail.com" is assigned to "Xmas" as "Volunteer"
    And "sarah@gmail.com" is assigned to "Tech" as "Chair"
    And "chris@gmail.com" is assigned to "Halloween" as "Chair"
    When I follow "Board Members"
    Then I should see /Chris Lerum[\sA-za-z,]+Publicity/
    And I should see /Chris Lerum[\sA-za-z,]+Halloween/
    And I should see /Liah Hansen[\sA-za-z,]+Xmas/
    And I should not see /Liah Hansen[\sA-za-z,]+Halloween/
    And I should see /Sarah Allen[\sA-za-z,]+Tech/
    And I should not see /Sarah Allen[\sA-za-z]+Xmas/

