Feature: display table of recipes

  As a kitchen newbie
  So that I can find recipes even I do not have anything in mind
  I want to see some popular recipes when I enter the app

  Background: recipes in database

    Given the following recipes exist:
      | name    | steps   | image_url | created_at              | updated_at              | id | origin_id |
      | recipe1 | 1 step  | url 1     | 2022-10-28 13:46:59 UTC | 2022-10-28 13:46:59 UTC | 1  |1          |
      | recipe2 | 2 steps | url 2     | 2022-10-28 13:47:03 UTC | 2022-10-28 13:47:03 UTC | 2  |2          |
      | recipe3 | 3 steps | url 3     | 2022-10-28 13:47:09 UTC | 2022-10-28 13:47:09 UTC | 3  |3          |
      | recipe4 | 4 steps | url 4     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 4  |4          |
      | recipe5 | 4 steps | url 5     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 5  |5          |
      | recipe6 | 4 steps | url 6     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 6  |6          |
      | recipe7 | 4 steps | url 7     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 7  |7          |
      | recipe8 | 4 steps | url 8     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 8  |8          |
      | recipe9 | 4 steps | url 9     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 9  |9          |
      | recipe10| 4 steps | url 10    | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 10 |10         |
      | recipe11| 4 steps | url 11    | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 11 |11         |
      | recipe12| 4 steps | url 12    | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 12 |12         |
      | recipe13| 4 steps | url 13    | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 13 |13         |
      | recipe14| 4 steps | url 14    | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 14 |14         |

    Given the following ingredients exist:
      | id | name        | calorie_per_serving | created_at | updated_at |
      | 1  | ingredient1 | 100              | created_at | updated_at |
      | 2  | ingredient2 | 200              | created_at | updated_at |
      | 3  | ingredient3 | 250              | created_at | updated_at |
      | 4  | ingredient4 | 250              | created_at | updated_at |

    Given the following recipe_ingredients exist:
      | id | unit | amount | metric_unit |metric_amount|created_at|updated_at|recipe_id|ingredient_id|
      | 1  | unit | amount | metric_unit |metric_amount|created_at|updated_at|  1      |1            |
      | 2  | unit | amount | metric_unit |metric_amount|created_at|updated_at|  1      |2            |
      | 3  | unit | amount | metric_unit |metric_amount|created_at|updated_at|  2      |1            |
      | 4  | unit | amount | metric_unit |metric_amount|created_at|updated_at|  3      |3            |


  Scenario: check recipes at main page and the splitting of page
    When I am on the home page
    And I should see "recipe1"
    And I should see "recipe12"
    And I should not see "recipe13"

  Scenario: jump to detail page when clicked
    Given I am on the home page
    When  I click the link for "recipe1"
    Then  I should be on the details page for "recipe1"
    And I should see "1 step"
    And I should see "ingredient1"
    But I should not see "2 steps"
    And I should not see "ingredient3"

  Scenario: find recipes with ingredient1
    Given I am on the home page
    And I fill in "keywords" with "ingredient1"
    And I press "Search"
    Then I should see "recipe1"
    And I should see "recipe2"
    And I should see "ingredient1"
    And I should not see "ingredient2"
    And I should not see "recipe3"

  Scenario: find recipes with ingredient1 and ingredient2
    Given I am on the home page
    And I fill in "keywords" with "ingredient1 ingredient2"
    And I press "Search"
    Then I should see "recipe1"
    And I should see "ingredient1"
    And I should see "ingredient2"
    And I should not see "recipe2"

  Scenario: search with empty search bar
    Given I am on the home page
    And I fill in "keywords" with ""
    And I press "Search"
    Then I am on the home page

  Scenario: jump to another page of recipes
    Given I am on the home page
    When  I follow "Next"
    Then I am on the second page
    And I should see "recipe13"
    When  I follow "Previous"
    Then I am on the home page
    And I should see "recipe1"
    When I click the link for "2"
    Then I should see "recipe13"

  Scenario: jump to another page of recipes
    Given I am on the home page


