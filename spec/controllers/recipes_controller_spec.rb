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
            recipe1 = FactoryGirl.create(:recipe, :name => 'recipe1', :id => '1')

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
end