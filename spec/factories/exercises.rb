FactoryGirl.define do

  sequence :exercise_name do |n|
    "exercise#{n}"
  end

  factory :exercise do |exercise|
    exercise.name { FactoryGirl.generate :exercise_name }
    exercise.user { FactoryGirl.build :user }
  end
end