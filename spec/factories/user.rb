FactoryGirl.define do
  factory :user do
    username "fake username"
    password_digest 'fake password' # default values
    created_at 'Fake date'
    updated_at 'Fake date'
  end
end