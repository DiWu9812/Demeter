FactoryGirl.define do
  factory :recipe_ingredient do
    id 'Fake id'
    unit 'Fake unit'
    amount 'Fake amount'
    metric_unit 'Fake metric_unit'
    metric_amount 'Fake metric_amount'
    created_at 'Fake date'
    updated_at 'Fake date'
    recipe_id 'Fake recipe_id'
    ingredient_id 'Fake ingredient_id'
  end
end