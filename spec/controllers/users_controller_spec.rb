require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  # sign up
  describe "POST #create" do
    # when username is new
    it "should redirect to home page if successfully create" do
      post :create, {:user=>{:username=>"username", :password=>"[FILTERED]"}}
      expect(response).to redirect_to('/recipes')
    end

    it "should stay on the sign up page if user already exist" do
       user = FactoryGirl.create(:user, :username => 'user1', :password_digest => 'password')
       post :create, {:user=>{:username=>"user1", :password=>"[FILTERED]"}}
       expect(response).to redirect_to('/signup')
    end
  end

end
