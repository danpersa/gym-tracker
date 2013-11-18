require 'spec_helper'

describe WorkoutSet do
  describe 'creation' do
    let :workout_set do
      FactoryGirl.build :workout_set
    end

    it 'should create a new workout' do
      workout_set.save.should == true
    end
  end
end