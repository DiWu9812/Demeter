require 'rails_helper'

RSpec.describe LoginSessionController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
    end
  end

# login...
  describe "POST #create" do
    # correct username and password
    it "should back to the home page if successfully signed in" do
        user = FactoryGirl.create(:user, :username => 'user1', :password_digest => BCrypt::Password.create('password').to_s)
        post :create, {:username=>'user1', :password=> 'password'}
        expect(response).to redirect_to('/recipes')
    end

    # incorrect username and password
    it "should stay on the sign in page if username and password does not match" do
        user = FactoryGirl.create(:user, :username => 'user1', :password_digest => BCrypt::Password.create('password').to_s)
        post :create, {:username=>'user1', :password=> 'password1'}
        expect(response).to redirect_to('/login')
    end

    # users have not sign up yet
    it "should stay on the sign in page if user has not sign up yet" do
        post :create, {:username=>'user1', :password=> 'password1'}
        expect(response).to redirect_to('/login')
    end
  end


# logout...
  describe "DELETE #destroy" do
    it "should log out current user" do
      user = FactoryGirl.create(:user, :id => '0', :username => 'user1', :password_digest => BCrypt::Password.create('password').to_s)
      post :create, {:username=>'user1', :password=> 'password'}
      expect(response).to redirect_to('/recipes')
      expect(session[:user_id]).to eql(user.id)
      delete :destroy
      expect(session[:user_id]).to eql(nil)
      expect(response).to redirect_to('/recipes')
    end
  end

end
