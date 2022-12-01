FactoryGirl.define do
  factory :user do
    username "fake username"
    password "fake raw password"
    password_confirmation "fake raw password"
    password_digest 'fake password' # default values
    created_at 'Fake date'
    updated_at 'Fake date'
  end
end