FactoryGirl.define do
  factory :rental do
    date_from "2016-08-26"
    date_to "2016-08-26"
    status 1
    user nil
    book nil
  end
end
