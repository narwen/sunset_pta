@focus
Feature: Authorized user can create a user
  In order to make the site useful
  As an authorized user
  I want to add new users to the system
  
  Scenario: Admin creates a user
    Given I am logged in as "bob@example.com"
    And I have the role "admin"
    And I am on the new user page
    When I fill in "first name" with "Arthur"
    And I fill in "last name" with "Jones"
    And I fill in "email" with "arthur.jones@gmail.com"
    And I press "Create User"
    Then I should see "New user Arthur Jones created."

  # Scenario: Non admin fails to create a user
  #   Given I am logged in as "bob@example.com"
  #   And I do not have the role "admin"
  #   And I go to the new user page
  #   Then I should see "Permission Denied!"