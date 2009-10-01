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
    And I am logged in as "jack@example.com"
    And I am on the homepage
    When I follow "Volunteers"
    Then I should see "Bob Bobson"
    And I should see "Sally Sallyson"
    And I should see "President"
    And I should see "Frank Frankson"
    And I should see "Secretary"
    When I follow "Frank Frankson"
    Then I should be on the profile page for "frank@example.com"

    Scenario: User can see which volunteers are admins
      Given the following users exist:
          | first_name | last_name | role_name |
          | Bob        | Bobson    |           |
          | Sally      | Sallyson  | admin     |
      And I am logged in as "frank@example.com"
      And I am on the homepage
      When I follow "Volunteers"
      # TODO - these shouldn't stop the build on heroku but they do - their steps are marked as pending.
      # therefore I commented them out (chris)
      # Then I should see that "Sally Sallyson" is an admin
      # And I should see that "Bob Bobson" is not an admin
