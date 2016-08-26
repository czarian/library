FactoryGirl.define do
  factory :user do
    email { "john@example.com".downcase }
    password "password"
  end
end
