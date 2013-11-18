FactoryGirl.define do

  factory :workout_set do |workout_set|
    workout_set.date      Time.now
    workout_set.weight    50
    workout_set.reps      10
    workout_set.exercise  { FactoryGirl.build :exercise }
  end
end