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
    it "-----" do
      # post :create, {"utf8"=>"✓", "xxx", "username"=>"wmj", "password"=>"123", "commit"=>"Login", "controller"=>"login_session", "action"=>"create"}
      # expect(response).to redirect_to('/recipes')
    end

    # incorrect username and password
    it "-----" do
      # post :create, {"utf8"=>"✓", "xxx", "username"=>"wmj", "password"=>"123", "commit"=>"Login", "controller"=>"login_session", "action"=>"create"}
      # expect(response).to redirect_to('/login')
    end
  end


# logout...
  describe "DELETE #destroy" do
    it "-----" do
      # delete :destroy
      # expect session[:user_id] not existed
      # expect(response).to redirect_to('/recipes')
    end
  end

end
