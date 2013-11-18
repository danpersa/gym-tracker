FactoryGirl.define do

  sequence :user_name do |n|
    "user#{n}"
  end

  sequence :user_uid do |n|
    "user#{n}"
  end

  factory :user do |user|
    user.name       { FactoryGirl.generate :user_name }
    user.uid        { FactoryGirl.generate :user_uid }
    user.provider   'facebook'
  end
end