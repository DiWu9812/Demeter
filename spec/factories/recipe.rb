FactoryGirl.define do
  factory :recipe do
    id "fake id"
    name 'A Fake Title' # default values
    steps 'Fake step'
    image_url 'Fake url'
    created_at 'Fake date'
    updated_at 'Fake date'
    origin_id 'Fake origin id from API'
  end
end