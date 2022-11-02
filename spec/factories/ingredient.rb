FactoryGirl.define do
  factory :ingredient do
    id "fake id"
    name 'A Fake Title' # default values
    calorie_per_gram 'Fake calorie'
    created_at 'Fake date'
    updated_at 'Fake date'
  end
end