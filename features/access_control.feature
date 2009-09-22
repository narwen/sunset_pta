Feature: Access control
  In order to use the application
  As a PTA member
  I want to login

  Scenario: A not logged in user visits the site and sees the login page
    Given I am not logged in
    When I go to the homepage
    Then I should be on the login page
    
  Scenario: A not logged in user cannot access the volunteers page
    Given I am not logged in
    When I go to the volunteers page
    Then I should see "Please login for restricted access."
    And I should be on the login page
    
  Scenario: A not logged in user cannot access the boards members page
    Given I am not logged in
    When I go to the board members list page
    Then I should see "Please login for restricted access."
    Then I should be on the login page
  
  Scenario: A not logged in user cannot access the positions page
    Given I am not logged in
    When I go to the positions page
    Then I should see "Please login for restricted access."
    And I should be on the login page
    
  Scenario: A not logged in user cannot access the committees page
    Given I am not logged in
    When I go to the committees page
    Then I should see "Please login for restricted access."
    And I should be on the login page
    