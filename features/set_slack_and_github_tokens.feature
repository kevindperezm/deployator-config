Feature: Set Slack and GitHub tokens
  As a logged user
  I want to set the Slack and GitHub tokens
  so I can talk to the bot from the chat

  @javascript
  @needs_seeds
  Scenario: Configuring bot for MyTeam organization
    Given I sign in
    And I am at the bot config page
    When I put MyTeam as Slack team
    And I put asd344j3k5jj2kj342 as Slack token
    And I put deployator as Bot name
    And I put http://deployator.herokuapp.com as Bot url
    And I put MyTeam as GitHub organization
    And I put asd344j3k5jj2kj342 as GitHub token
    And I put 5 as Deploy timeout
    And I click on Save
    Then I should see heroku config:set HUBOT_SLACK_BOTNAME=deployator HUBOT_SLACK_TEAM=MyTeam HUBOT_SLACK_TOKEN=asd344j3k5jj2kj342 HUBOT_GITHUB_TOKEN=asd344j3k5jj2kj342 HUBOT_DEPLOY_TIMEOUT=5
    And I should see instructions of what to do with the command
    And I should see instructions to connect with Slack

  @javascript
  @needs_seeds
  Scenario: Configuring bot for AwesomeTeam organization
    Given I sign in
    And I am at the bot config page
    When I put AwesomeTeam as Slack team
    And I put kj45kh56jk345 as Slack token
    And I put http://deployerbot.herokuapp.com as Bot url
    And I put deployerbot as Bot name
    And I put AwesomeTeam as GitHub organization
    And I put kj45kh56jk345 as GitHub token
    And I put 10 as Deploy timeout
    And I click on Save
    Then I should see heroku config:set HUBOT_SLACK_BOTNAME=deployerbot HUBOT_SLACK_TEAM=AwesomeTeam HUBOT_SLACK_TOKEN=kj45kh56jk345 HUBOT_GITHUB_TOKEN=kj45kh56jk345 HUBOT_DEPLOY_TIMEOUT=10
    And I should see instructions of what to do with the command
    And I should see instructions to connect with Slack

@javascript
@needs_seeds
Scenario: Sending an invalid bot config
  Given I sign in
  And I am at the bot config page
  When I put nothing as Slack team
  And I click on Save
  Then I should see an invalid config message
  And I should see the Save button
