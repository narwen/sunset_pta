Feature: Browse all volunteers
  In order to find contact info for volunteers
  As a PTA member
  I want to browse all the volunteers

  Scenario: Authenticated user browses volunteer list
    Given the following users exist:
      | first_name | last_name | email             |
      | Bob        | Bobson    | bob@example.com   |
      | Sally      | Sallyson  | sally@example.com |
      | Frank      | Frankson  | frank@example.com |
    And I am on the homepage
    When I follow "Volunteers"
    Then I should see "Bob Bobson"
    And I should see "Sally Sallyson"
    And I should see "Frank Frankson"
    When I follow "Frank Frankson"
    Then I should be on the profile page for "frank@example.com"

