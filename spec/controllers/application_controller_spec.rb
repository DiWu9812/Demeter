require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
    describe "valid user" do
        it "should display the correct user who logged in" do
            user = FactoryGirl.create(:user, :id => '0', :username => 'user1', :password_digest => BCrypt::Password.create('password').to_s)
            session[:user_id] = "0"
            subject.valid_user.should eql(user)
        end
    end

    describe "logged?" do
        it "should return true if a valid user is present" do
            user = FactoryGirl.create(:user, :id => '0', :username => 'user1', :password_digest => BCrypt::Password.create('password').to_s)
            session[:user_id] = "0"
            subject.logged?.should eql(true)
        end
    end
end