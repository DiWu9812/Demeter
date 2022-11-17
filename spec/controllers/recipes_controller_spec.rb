require 'rails_helper'

describe RecipesController do
    describe "search_index" do
        describe "display search index page if search result exist" do
            it "should support search by 1 ingredient" do
                post :search_index, {:keywords => "milk"}
                expect(response).to redirect_to('/recipes/search/milk')
            end

            it "should support search by multiple ingredient" do
                post :search_index, {:keywords => "milk almond"}
                expect(response).to redirect_to('/recipes/search/milk%20almond')
            end
        end

        it "should redirect to the home page if search query is empty" do
            post :search_index
            expect(response).to redirect_to('/recipes')
        end
    end

    describe "search" do
        it "return search result" do
            # Mock recipe
            recipe1 = FactoryGirl.create(:recipe, :name => 'recipe1', :id => '1', :origin_id => '12345')

            # Mock ingredient
            ingredient1 = FactoryGirl.create(:ingredient, :name => 'milk', :id => '1')
            ingredient2 = FactoryGirl.create(:ingredient, :name => 'almond', :id => '2')

            # Mock recipe_ingredient
            recipe_ingredient1 =
                        FactoryGirl.create(:recipe_ingredient, :id => '1', :ingredient_id => '1', :recipe_id => '1')
            recipe_ingredient2 =
                        FactoryGirl.create(:recipe_ingredient, :id => '2', :ingredient_id => '2', :recipe_id => '1')



            @keywords = ["milk", "almond"]
            get :search, {:q => "milk almond"}
            expect(assigns(:keywords)).to eql(@keywords)
            expect(assigns(:selected)).to eql([recipe1])
        end
    end

    describe "index" do
        it 'should render the index template' do
          get :index
          expect(response).to redirect_to('/recipes/page/1')
        end
    end


    describe "page" do
        it 'should render the index template' do
          recipe1 = FactoryGirl.create(:recipe, :name => 'recipe1', :id => '1', :origin_id => '12345')
          get :page, {:id => 1}
          expect(response).to render_template('index')
        end
    end


    describe "favorite" do
        it 'should render the index template' do
          user1 = FactoryGirl.create(:user, :username => 'user1', :password_digest => '123')
          session[:return_to] = '/recipes/page/1'
          session[:user_id] = 1
          post :favorite, {:id => 1, :positive => "true"}
          expect(response).to redirect_to('/recipes/page/1')
        end

        it 'should render the index template 2' do
          user1 = FactoryGirl.create(:user, :username => 'user1', :password_digest => '123')
          session[:return_to] = '/recipes/page/1'
          session[:user_id] = 1
          post :favorite, {:id => 1, :positive => "false"}
          expect(response).to redirect_to('/recipes/page/1')
        end
    end


    describe "favorited" do
        it 'should render the have_to_login template' do
          get :favorited
          expect(response).to render_template('have_to_login')
        end
        it 'should render the index template' do
          user1 = FactoryGirl.create(:user, :username => 'user1', :password_digest => '123')
          session[:return_to] = '/recipes/page/1'
          session[:user_id] = 1
          get :favorited
          expect(response).to render_template('index')
        end
    end

    describe "show" do
        it 'should find the recipe' do
          recipe = FactoryGirl.create(:recipe, :name => 'recipe', :id => '0', :origin_id => '0')
          ingredient = FactoryGirl.create(:ingredient, :name => 'ingredient', :id => '0')
          recipe_ingredient = FactoryGirl.create(:recipe_ingredient, :id => '0', :ingredient_id => '0', :recipe_id => '0')

          get :show, id: recipe.id
          expect(assigns(:recipe)).to eql(recipe)
        end
    end

end