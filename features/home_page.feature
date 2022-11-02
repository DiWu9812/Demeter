Feature: display table of recipes

  As a kitchen newbie
  So that I can find recipes even I do not have anything in mind
  I want to see some popular recipes when I enter the app

  Background: recipes in database

    Given the following recipes exist:
      | name    | steps   | image_url | created_at              | updated_at              | cuisine_id| id |
      | recipe1 | 1 step  | url 1     | 2022-10-28 13:46:59 UTC | 2022-10-28 13:46:59 UTC |           | 1  |
      | recipe2 | 2 steps | url 2     | 2022-10-28 13:47:03 UTC | 2022-10-28 13:47:03 UTC |           | 2  |
      | recipe3 | 3 steps | url 3     | 2022-10-28 13:47:09 UTC | 2022-10-28 13:47:09 UTC |           | 3  |
      | recipe4 | 4 steps | url 4     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC |           | 4  |

    Given the following ingredients exist:
      | id | name        | calorie_per_gram | created_at | updated_at |
      | 1  | ingredient1 | 100              | created_at | updated_at |
      | 2  | ingredient2 | 200              | created_at | updated_at |

    Given the following recipe_ingredients exist:
      | id | unit | amount | metric_unit |metric_amount|created_at|updated_at|recipe_id|ingredient_id|
      | 1  | unit | amount | metric_unit |metric_amount|created_at|updated_at|  1      |1            |
      | 2  | unit | amount | metric_unit |metric_amount|created_at|updated_at|  1      |2            |



  Scenario: display recipes at main page
    When I am on the home page
    Then I should see a table of recipes

  Scenario: jump to detail page when clicked
    Given I am on the home page
    When  I click the link for "recipe1"
    Then  I should be on the details page for "recipe1"
    And I should see "1 step"
    And I should see "ingredient1"
    But I should not see "2 steps"
    And I should not see "ingredient3"