Given /the following recipes exist/ do |recipes_table|
 recipes_table.hashes.each do |recipe|
   Recipe.create recipe
 end
end

Given /the following ingredients exist/ do |ingredients_table|
 ingredients_table.hashes.each do |ingredient|
   Ingredient.create ingredient
 end
end

Given /the following recipe_ingredients exist/ do |recipe_ingredients_table|
 recipe_ingredients_table.hashes.each do |recipe_ingredient|
   RecipeIngredient.create recipe_ingredient
 end
end

Then /I should see a table of recipes/ do
 Recipe.all.each do |recipe|
   step %{I should see "#{recipe.name}"}
 end
end

When(/^I click the link for "([^"]*)"$/) do |name|
 id = Recipe.find_by(name: name)[:id]
 click_link(id)
end