Feature: Able to sign up or sign in

  As someone who loves to cook
  So that I can see my saved menus
  I want to be able to sign up or sign in


  Background: users in database

    Given the following users exist:
      | username |  password  | password_confirmation | password_digest                                                        | created_at | updated_at |
      | user1    |  "1234567" | "1234567"             | $2a$12$1oYVNYIZa8G3LiX7neySPuTyw0tFI6.xJ1kozb3os95tRAGZ7Xybe           | created_at | updated_at |


  Scenario: sign up if new user
    When I am on the home page
    And I follow "Sign Up"
    And I should see "Username"
    And I should see "Password"
    When I fill in "Username" with "user2"
    When I fill in "Password" with "1234567"
    When I fill in "Password Confirmation" with "1234567"
    And I press "Create User"
    Then I am on the home page
    And I should see "Hi, user2!"

  Scenario: back to sign up page if user exist
    When I am on the sign up page
    And I fill in "Username" with "user1"
    When I fill in "Password" with "1234567"
    When I fill in "Password Confirmation" with "1234567"
    And I press "Create User"
    Then I am on the sign up page
  
  Scenario: back to sign up page if user or password invalid
    When I am on the sign up page
    And I fill in "Username" with "user2"
    When I fill in "Password" with ""
    When I fill in "Password Confirmation" with ""
    And I press "Create User"
    Then I am on the sign up page

  Scenario: login if user already sign up
    When I am on the home page
    And I follow "Login"
    Then I am on the login page
    And I fill in "Username" with "user1"
    And I fill in "Password" with "1234567"
    And I follow "Login"
    Then I am on the home page

  Scenario: login failed if user have not sign up yet
    When I am on the login page
    And I fill in "Username" with "user2"
    And I fill in "Password" with "1234567"
    And I follow "Login"
    Then I am on the login page

  Scenario: login failed if username and password does not match
    When I am on the login page
    And I fill in "Username" with "user1"
    And I fill in "Password" with "12345678"
    And I follow "Login"
    Then I am on the login page

  Scenario: user can successfully logout
    When I am on the home page
    And I follow "Sign Up"
    And I should see "Username"
    And I should see "Password"
    When I fill in "Username" with "user3"
    When I fill in "Password" with "123456789"
    When I fill in "Password Confirmation" with "123456789"
    And I press "Create User"
    Then I am on the home page
    And I should see "Hi, user3!"
    Then I follow "Logout"
    Then I should not see "Hi, user3!"

  Scenario: user can successfully login
    When I am on the home page
    And I follow "Sign Up"
    And I should see "Username"
    And I should see "Password"
    When I fill in "Username" with "user4"
    When I fill in "Password" with "123456789"
    When I fill in "Password Confirmation" with "123456789"
    And I press "Create User"
    Then I am on the home page
    And I should see "Hi, user4!"
    Then I follow "Logout"
    Then I should not see "Hi, user4!"
    And I follow "Login"
    Then I am on the login page
    And I fill in "Username" with "user4"
    And I fill in "Password" with "123456789"
    And I press "Login"
    Then I am on the home page
    And I should see "Hi, user4!"

  Scenario: user can fail to login with wrong password
    When I am on the home page
    And I follow "Sign Up"
    And I should see "Username"
    And I should see "Password"
    When I fill in "Username" with "user4"
    When I fill in "Password" with "1234567"
    When I fill in "Password Confirmation" with "1234567"
    And I press "Create User"
    Then I am on the home page
    And I should see "Hi, user4!"
    Then I follow "Logout"
    Then I should not see "Hi, user4!"
    And I follow "Login"
    Then I am on the login page
    And I fill in "Username" with "user4"
    And I fill in "Password" with "12345678"
    And I press "Login"
    Then I am on the login page
