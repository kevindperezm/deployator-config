Feature: Login
  As a user with a @crowdint.com account
  I want to login to the app
  so I can start using the system

  @javascript
  Scenario: Login with kevin.perez@crowdint.com account
    Given I am at the login page
    And I have entered kevin.perez@crowdint.com as the user
    And I have entered crowdsmkd123? as the password
    When I click the login button
    And I give access permission if needed
    Then I should see the apps dashboard page
