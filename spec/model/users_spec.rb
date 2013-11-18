require 'spec_helper'

describe User do
  describe 'creation' do
    let :user do
      FactoryGirl.build :user
    end

    it 'should create a new user' do
      user.save.should == true
    end
  end
end