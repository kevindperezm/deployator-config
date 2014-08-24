Feature: Add an app for deploying
  As a logged user
  I want to be able to add a GitHub repo to be deployed by Deployator
  so I can configure the enviroments where it will be deployed

  Scenario: Open 'New app' page
    Given I sign in
    And I am at the apps dashboard page
    When I click on New App
    Then I should see the New App page

  @javascript @need_seeds
  Scenario: Add new app 'hellocat' for deploying
    Given I sign in
    And I am at the New App page
    When I put hellocat as App name
    And I put hellocat as GitHub repository
    And I click on Create
    Then I should see "App created!"
    And I should see instructions for GitHub config
