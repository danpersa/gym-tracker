require 'spec_helper'

describe Exercise do
  describe 'creation' do
    let :exercise do
      FactoryGirl.build :exercise
    end

    it 'should create a new exercise' do
      exercise.save.should == true
    end
  end
end