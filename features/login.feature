Feature: Login
  As a user with a @crowdint.com account
  I want to login to the app
  so I can start using the system

  @javascript
  Scenario: Login with kevin.perez@crowdint.com account
    Given I am at the home page
    And I click the sign in button
    When I sign in
    And I authorize the app
    Then I should see the apps dashboard page
