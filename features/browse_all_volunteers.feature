Feature: Browse all volunteers
  In order to find contact info for volunteers
  As a PTA member
  I want to browse all the volunteers

  Scenario: Authenticated user browses volunteer list
    Given the following users exist:
      | first_name | last_name | email             | position_title |
      | Bob        | Bobson    | bob@example.com   |                |
      | Sally      | Sallyson  | sally@example.com | President      |
      | Frank      | Frankson  | frank@example.com | Secretary      |
    And I am on the homepage
    When I follow "Volunteers"
    Then I should see "Bob Bobson"
    And I should see "Sally Sallyson"
    And I should see "President"
    And I should see "Frank Frankson"
    And I should see "Secretary"
    When I follow "Frank Frankson"
    Then I should be on the profile page for "frank@example.com"

