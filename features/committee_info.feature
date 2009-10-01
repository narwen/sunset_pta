Feature: Everyone can view committee info
  In order to contact committee volunteers
  As a volunteer
  I want to view committee info

Scenario: Committee list shows chair(s) for each committee
    Given I am logged in as "anybody@sunset-pta.com"
    And there is a committee "Publicity"
    And there is a user "chris@gmail.com" with name "Chris Lerum"
    And "chris@gmail.com" is assigned to "Publicity" as "Volunteer"
    And there is a user "liah@gmail.com" with name "Liah Hansen"
    And "liah@gmail.com" is assigned to "Publicity" as "Chair"
    And there is a user "sarah@gmail.com" with name "Sarah Allen"
    And "sarah@gmail.com" is assigned to "Publicity" as "Chair"
    When I follow "Committees"
    Then I should see /Publicity[\sA-za-z]+Liah Hansen/
    And I should see /Publicity[\sA-za-z,]+Sarah Allen/
    And I should not see /Publicity[\sA-za-z]+Chris Lerum/

 Scenario: Committee info page shows chair(s) and then volunteers for each committee
    Given I am logged in as "anybody@sunset-pta.com"
    And there is a committee "Publicity"
    And there is a user "chris@gmail.com" with name "Chris Lerum"
    And "chris@gmail.com" is assigned to "Publicity" as "Volunteer"
    And there is a user "liah@gmail.com" with name "Liah Hansen"
    And "liah@gmail.com" is assigned to "Publicity" as "Chair"
    And there is a user "sarah@gmail.com" with name "Sarah Allen"
    And "sarah@gmail.com" is assigned to "Publicity" as "Chair"
    When I follow "Committees"
    And I follow "Publicity"
    Then I should see /Liah Hansen[\s]+Chair[\sA-Za-z]+Chris Lerum[\s]+Volunteer/
    And I should see /Sarah Allen[\s]+Chair[\sA-Za-z]+Chris Lerum[\s]+Volunteer/