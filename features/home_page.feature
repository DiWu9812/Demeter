Feature: display table of recipes

  As a kitchen newbie
  So that I can find recipes even I do not have anything in mind
  I want to see some popular recipes when I enter the app

  Background: recipes and users in database

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
      | recipe10 | 4 steps | url 10     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 10  |10          |
      | recipe11 | 4 steps | url 11     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 11  |11          |
      | recipe12 | 4 steps | url 12     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 12  |12          |
      | recipe13 | 4 steps | url 13     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 13  |13          |
      | recipe14 | 4 steps | url 14     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 14  |14          |
      | recipe15 | 4 steps | url 15     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 15  |15          |
      | recipe16 | 4 steps | url 16     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 16  |16          |
      | recipe17 | 4 steps | url 17     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 17  |17          |
      | recipe18 | 4 steps | url 18     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 18  |18          |
      | recipe19 | 4 steps | url 19     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 19  |19          |
      | recipe20 | 4 steps | url 20     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 20  |20          |
      | recipe21 | 4 steps | url 21     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 21  |21          |
      | recipe22 | 4 steps | url 22     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 22  |22          |
      | recipe23 | 4 steps | url 23     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 23  |23          |
      | recipe24 | 4 steps | url 24     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 24  |24          |
      | recipe25 | 4 steps | url 25     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 25  |25          |
      | recipe26 | 4 steps | url 26     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 26  |26          |
      | recipe27 | 4 steps | url 27     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 27  |27          |
      | recipe28 | 4 steps | url 28     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 28  |28          |
      | recipe29 | 4 steps | url 29     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 29  |29          |
      | recipe30 | 4 steps | url 30     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 30  |30          |
      | recipe31 | 4 steps | url 31     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 31  |31          |
      | recipe32 | 4 steps | url 32     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 32  |32          |
      | recipe33 | 4 steps | url 33     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 33  |33          |
      | recipe34 | 4 steps | url 34     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 34  |34          |
      | recipe35 | 4 steps | url 35     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 35  |35          |
      | recipe36 | 4 steps | url 36     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 36  |36          |
      | recipe37 | 4 steps | url 37     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 37  |37          |
      | recipe38 | 4 steps | url 38     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 38  |38          |
      | recipe39 | 4 steps | url 39     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 39  |39          |
      | recipe40 | 4 steps | url 40     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 40  |40          |
      | recipe41 | 4 steps | url 41     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 41  |41          |
      | recipe42 | 4 steps | url 42     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 42  |42          |
      | recipe43 | 4 steps | url 43     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 43  |43          |
      | recipe44 | 4 steps | url 44     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 44  |44          |
      | recipe45 | 4 steps | url 45     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 45  |45          |
      | recipe46 | 4 steps | url 46     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 46  |46          |
      | recipe47 | 4 steps | url 47     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 47  |47          |
      | recipe48 | 4 steps | url 48     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 48  |48          |
      | recipe49 | 4 steps | url 49     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 49  |49          |
      | recipe50 | 4 steps | url 50     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 50  |50          |
      | recipe51 | 4 steps | url 51     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 51  |51          |
      | recipe52 | 4 steps | url 52     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 52  |52          |
      | recipe53 | 4 steps | url 53     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 53  |53          |
      | recipe54 | 4 steps | url 54     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 54  |54          |
      | recipe55 | 4 steps | url 55     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 55  |55          |
      | recipe56 | 4 steps | url 56     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 56  |56          |
      | recipe57 | 4 steps | url 57     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 57  |57          |
      | recipe58 | 4 steps | url 58     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 58  |58          |
      | recipe59 | 4 steps | url 59     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 59  |59          |
      | recipe60 | 4 steps | url 60     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 60  |60          |
      | recipe61 | 4 steps | url 61     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 61  |61          |
      | recipe62 | 4 steps | url 62     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 62  |62          |
      | recipe63 | 4 steps | url 63     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 63  |63          |
      | recipe64 | 4 steps | url 64     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 64  |64          |
      | recipe65 | 4 steps | url 65     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 65  |65          |
      | recipe66 | 4 steps | url 66     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 66  |66          |
      | recipe67 | 4 steps | url 67     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 67  |67          |
      | recipe68 | 4 steps | url 68     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 68  |68          |
      | recipe69 | 4 steps | url 69     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 69  |69          |
      | recipe70 | 4 steps | url 70     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 70  |70          |
      | recipe71 | 4 steps | url 71     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 71  |71          |
      | recipe72 | 4 steps | url 72     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 72  |72          |
      | recipe73 | 4 steps | url 73     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 73  |73          |
      | recipe74 | 4 steps | url 74     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 74  |74          |
      | recipe75 | 4 steps | url 75     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 75  |75          |
      | recipe76 | 4 steps | url 76     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 76  |76          |
      | recipe77 | 4 steps | url 77     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 77  |77          |
      | recipe78 | 4 steps | url 78     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 78  |78          |
      | recipe79 | 4 steps | url 79     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 79  |79          |
      | recipe80 | 4 steps | url 80     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 80  |80          |
      | recipe81 | 4 steps | url 81     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 81  |81          |
      | recipe82 | 4 steps | url 82     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 82  |82          |
      | recipe83 | 4 steps | url 83     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 83  |83          |
      | recipe84 | 4 steps | url 84     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 84  |84          |
      | recipe85 | 4 steps | url 85     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 85  |85          |
      | recipe86 | 4 steps | url 86     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 86  |86          |
      | recipe87 | 4 steps | url 87     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 87  |87          |
      | recipe88 | 4 steps | url 88     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 88  |88          |
      | recipe89 | 4 steps | url 89     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 89  |89          |
      | recipe90 | 4 steps | url 90     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 90  |90          |
      | recipe91 | 4 steps | url 91     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 91  |91          |
      | recipe92 | 4 steps | url 92     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 92  |92          |
      | recipe93 | 4 steps | url 93     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 93  |93          |
      | recipe94 | 4 steps | url 94     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 94  |94          |
      | recipe95 | 4 steps | url 95     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 95  |95          |
      | recipe96 | 4 steps | url 96     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 96  |96          |
      | recipe97 | 4 steps | url 97     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 97  |97          |
      | recipe98 | 4 steps | url 98     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 98  |98          |
      | recipe99 | 4 steps | url 99     | 2022-10-28 13:47:27 UTC | 2022-10-28 13:47:27 UTC | 99  |99          |

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
    Then I should see the recipes on page 1

  Scenario: display recipes at further pages
    When I am on the home page
    And I follow "Sign Up"
    And I should see "Username"
    And I should see "Password"
    When I fill in "Username" with "user4"
    When I fill in "Password" with "1234567"
    When I fill in "Password Confirmation" with "1234567"
    And I press "Create User"
    Then I am on the home page
    When I am on the 4th page
    Then I should see the recipes on page 4

  Scenario: display recipes at favorited pages
    When I am on the home page
    And I follow "Sign Up"
    And I should see "Username"
    And I should see "Password"
    When I fill in "Username" with "user4"
    When I fill in "Password" with "1234567"
    When I fill in "Password Confirmation" with "1234567"
    And I press "Create User"
    Then I am on the home page
    When I am on the favorited page
    And I should see "Favorited recipes for user4"

  Scenario: display recipes at favorited pages
    When I am on the home page
    And I follow "Sign Up"
    And I should see "Username"
    And I should see "Password"
    When I fill in "Username" with "user5"
    When I fill in "Password" with "12345678"
    When I fill in "Password Confirmation" with "12345678"
    And I press "Create User"
    Then I am on the home page
    When I click the favorite for "recipe1"
    Then I am on the home page
    When I am on the favorited page
    And I should see "Favorited recipes for user5"
    When I am on the home page
    When I click the favorite for "recipe1"
    Then I am on the home page

  Scenario: fail to see create recipes when didn't login
    When I am on the created recipe page
    Then I should see "You have to login or sign up to view this page"

  Scenario: fail to create a recipe of user due to missing recipe name, steps, ingredient name or amount
    When I am on the home page
    And I follow "Sign Up"
    And I should see "Username"
    And I should see "Password"
    When I fill in "Username" with "user6"
    When I fill in "Password" with "1234567"
    When I fill in "Password Confirmation" with "1234567"
    And I press "Create User"
    Then I am on the home page
    When I am on the created recipe page
    And I should see "Recipes created by user6"
    Then I follow "New"
    Then I should see "Have Ideas? Create Your Own Recipe Here!"
    And I press "Submit"
    And I should see "Oops! There are something wrong happen:"
    And I should see "Recipe has no name."
    And I should see "Recipe has no steps."
    And I should see "Ingredient name or amount is empty."

  Scenario: fail to create a recipe of user due to no ingredient
    When I am on the home page
    And I follow "Sign Up"
    And I should see "Username"
    And I should see "Password"
    When I fill in "Username" with "user7"
    When I fill in "Password" with "1234567"
    When I fill in "Password Confirmation" with "1234567"
    And I press "Create User"
    Then I am on the home page
    When I am on the created recipe page
    And I should see "Recipes created by user7"
    Then I follow "New"
    When I fill in the name with "dummy recipe"
    When I fill in the steps with "dummy steps"
    Then I hit the 1st remove button
    And I press "Submit"
    And I should see "Ingredient name or amount is empty."


  Scenario: create and display recipes of user
    When I am on the home page
    And I follow "Sign Up"
    And I should see "Username"
    And I should see "Password"
    When I fill in "Username" with "user8"
    When I fill in "Password" with "1234567"
    When I fill in "Password Confirmation" with "1234567"
    And I press "Create User"
    Then I am on the home page
    When I am on the created recipe page
    And I should see "Recipes created by user8"
    Then I follow "New"
    Then I should see "Have Ideas? Create Your Own Recipe Here!"
    And I fill in "Name" with "My Recipe"
    And I fill in the 1st Ingredient with "water"
    And I fill in the 1st Amount with "1"
    And I fill in the 1st Unit with "50ml"
    And I fill in "steps" with "1234567"
    And I press "Submit"
    And I should see "Yay! Your recipe has been created successfully!"
    When I am on the created recipe page
    Then I follow "New"
    And I fill in "Name" with "My Recipe 2"
    And I fill in the 1st Ingredient with "water"
    And I fill in the 1st Amount with "2"
    And I fill in the 1st Unit with "50ml"
    And I fill in "steps" with "12345678"
    And I press "Submit"
    And I should see "Yay! Your recipe has been created successfully!"
    When I am on the created recipe page
    And I should see "My Recipe"
    And I should see "My Recipe 2"



  Scenario: display the favorited pages for no user
    When I am on the favorited page
    And I should see "You have to login or sign up to view this page"

  Scenario: jump to detail page when clicked
    Given I am on the home page
    When  I click the link for "recipe1"
    Then  I should be on the details page for "recipe1"
    And I should see "1 step"
    And I should see "ingredient1"
    But I should not see "2 steps"
    And I should not see "ingredient3"

  Scenario: upvote and downvote recipes
    Given I am on the home page
    When  I click the link for "recipe1"
    Then  I should be on the details page for "recipe1"
    When I click the upvote
    Then  I should be on the details page for "recipe1"
    But I should see "1"
    When I click the upvote
    When I click the upvote
    When I click the upvote
    When I click the upvote
    When I click the upvote
    When I click the upvote
    When I click the upvote
    When I click the upvote
    When I click the upvote
    When I click the upvote
    But I should see "11"
    When I click the downvote
    Then  I should be on the details page for "recipe1"
    When I click the downvote
    When I click the downvote
    When I click the downvote
    When I click the downvote
    When I click the downvote
    When I click the downvote
    When I click the downvote
    When I click the downvote
    When I click the downvote
    When I click the downvote
    When I click the downvote
    When I click the downvote
    But I should see "13"

  Scenario: downvote recipes
    Given I am on the home page
    When  I click the link for "recipe1"
    Then  I should be on the details page for "recipe1"
    When I click the downvote
    Then  I should be on the details page for "recipe1"
    When I click the downvote
    When I click the downvote
    When I click the downvote
    When I click the downvote
    But I should see "5"

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

  Scenario: jump to another page of recipes
    Given I am on the home page


