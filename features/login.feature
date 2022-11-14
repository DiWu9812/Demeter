Feature: Able to sign up or sign in

  As someone who loves to cook
  So that I can see my saved menus
  I want to be able to sign up or sign in


  Background: users in database

    Given the following users exist:
      | username | password_digest                                                        | created_at | updated_at |
      | user1    | $2a$12$1oYVNYIZa8G3LiX7neySPuTyw0tFI6.xJ1kozb3os95tRAGZ7Xybe           | created_at | updated_at |


  Scenario: sign up if new user
    When I am on the home page
    And I press "Sign Up"
    And I should see "Username"
    And I should see "Password"
    When I fill in "Username" with "user2"
    When I fill in "Password" with "12345"
    And I press "Create User"
    Then I am on the home page
    And I should see "Successfully Logged In, user2"

  Scenario: back to sign up page if user exist
    When I am on the sign up page
    And I fill in "Username" with "user1"
    And I fill in "Password" with "12345"
    And I press "Create User"
    Then I am on the sign up page

  Scenario: login if user already sign up
    When I am on the home page
    And I press "Login"
    Then I am on the login page
    And I fill in "Username" with "user1"
    And I fill in "Password" with "123"
    And I press "Login"
    Then I am on the home page

  Scenario: login failed if user have not sign up yet
    When I am on the login page
    And I fill in "Username" with "user2"
    And I fill in "Password" with "123"
    And I press "Login"
    Then I am on the login page

  Scenario: login failed if username and password does not match
    When I am on the login page
    And I fill in "Username" with "user1"
    And I fill in "Password" with "12345"
    And I press "Login"
    Then I am on the login page

  Scenario: user can successfully logout
    When I am on the home page
    And I press "Login"
    Then I am on the login page
    And I fill in "Username" with "user1"
    And I fill in "Password" with "123"
    And I press "Login"
    Then I am on the home page
    And I should see "Successfully Logged In, user1"
    Then I press "Log out"
    Then I should not see "Successfully Logged In, user1"