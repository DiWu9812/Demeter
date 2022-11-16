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
    it "-----" do
      post :create, {:user=>{:username=>"username", :password=>"[FILTERED]"}}
      expect(response).to redirect_to('/recipes')
    end

    # TODO: when username is duplicated....should stay on "Sign up" page
  end

end
