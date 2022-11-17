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

        it 'should render the index template with favorited' do
          recipe2 = FactoryGirl.create(:recipe, :name => 'recipe2', :id => '2', :origin_id => '2')
          recipe3 = FactoryGirl.create(:recipe, :name => 'recipe3', :id => '3', :origin_id => '3')
          recipe4 = FactoryGirl.create(:recipe, :name => 'recipe4', :id => '4', :origin_id => '4')
          recipe5 = FactoryGirl.create(:recipe, :name => 'recipe5', :id => '5', :origin_id => '5')
          recipe6 = FactoryGirl.create(:recipe, :name => 'recipe6', :id => '6', :origin_id => '6')
          recipe7 = FactoryGirl.create(:recipe, :name => 'recipe7', :id => '7', :origin_id => '7')
          recipe8 = FactoryGirl.create(:recipe, :name => 'recipe8', :id => '8', :origin_id => '8')
          recipe9 = FactoryGirl.create(:recipe, :name => 'recipe9', :id => '9', :origin_id => '9')
          recipe10 = FactoryGirl.create(:recipe, :name => 'recipe10', :id => '10', :origin_id => '10')
          recipe11 = FactoryGirl.create(:recipe, :name => 'recipe11', :id => '11', :origin_id => '11')
          recipe12 = FactoryGirl.create(:recipe, :name => 'recipe12', :id => '12', :origin_id => '12')
          recipe13 = FactoryGirl.create(:recipe, :name => 'recipe13', :id => '13', :origin_id => '13')
          recipe14 = FactoryGirl.create(:recipe, :name => 'recipe14', :id => '14', :origin_id => '14')
          recipe15 = FactoryGirl.create(:recipe, :name => 'recipe15', :id => '15', :origin_id => '15')
          recipe16 = FactoryGirl.create(:recipe, :name => 'recipe16', :id => '16', :origin_id => '16')
          recipe17 = FactoryGirl.create(:recipe, :name => 'recipe17', :id => '17', :origin_id => '17')
          recipe18 = FactoryGirl.create(:recipe, :name => 'recipe18', :id => '18', :origin_id => '18')
          recipe19 = FactoryGirl.create(:recipe, :name => 'recipe19', :id => '19', :origin_id => '19')
          recipe20 = FactoryGirl.create(:recipe, :name => 'recipe20', :id => '20', :origin_id => '20')
          recipe21 = FactoryGirl.create(:recipe, :name => 'recipe21', :id => '21', :origin_id => '21')
          recipe22 = FactoryGirl.create(:recipe, :name => 'recipe22', :id => '22', :origin_id => '22')
          recipe23 = FactoryGirl.create(:recipe, :name => 'recipe23', :id => '23', :origin_id => '23')
          recipe24 = FactoryGirl.create(:recipe, :name => 'recipe24', :id => '24', :origin_id => '24')
          recipe25 = FactoryGirl.create(:recipe, :name => 'recipe25', :id => '25', :origin_id => '25')
          recipe26 = FactoryGirl.create(:recipe, :name => 'recipe26', :id => '26', :origin_id => '26')
          recipe27 = FactoryGirl.create(:recipe, :name => 'recipe27', :id => '27', :origin_id => '27')
          recipe28 = FactoryGirl.create(:recipe, :name => 'recipe28', :id => '28', :origin_id => '28')
          recipe29 = FactoryGirl.create(:recipe, :name => 'recipe29', :id => '29', :origin_id => '29')
          recipe30 = FactoryGirl.create(:recipe, :name => 'recipe30', :id => '30', :origin_id => '30')
          recipe31 = FactoryGirl.create(:recipe, :name => 'recipe31', :id => '31', :origin_id => '31')
          recipe32 = FactoryGirl.create(:recipe, :name => 'recipe32', :id => '32', :origin_id => '32')
          recipe33 = FactoryGirl.create(:recipe, :name => 'recipe33', :id => '33', :origin_id => '33')
          recipe34 = FactoryGirl.create(:recipe, :name => 'recipe34', :id => '34', :origin_id => '34')
          recipe35 = FactoryGirl.create(:recipe, :name => 'recipe35', :id => '35', :origin_id => '35')
          recipe36 = FactoryGirl.create(:recipe, :name => 'recipe36', :id => '36', :origin_id => '36')
          recipe37 = FactoryGirl.create(:recipe, :name => 'recipe37', :id => '37', :origin_id => '37')
          recipe38 = FactoryGirl.create(:recipe, :name => 'recipe38', :id => '38', :origin_id => '38')
          recipe39 = FactoryGirl.create(:recipe, :name => 'recipe39', :id => '39', :origin_id => '39')
          recipe40 = FactoryGirl.create(:recipe, :name => 'recipe40', :id => '40', :origin_id => '40')
          recipe41 = FactoryGirl.create(:recipe, :name => 'recipe41', :id => '41', :origin_id => '41')
          recipe42 = FactoryGirl.create(:recipe, :name => 'recipe42', :id => '42', :origin_id => '42')
          recipe43 = FactoryGirl.create(:recipe, :name => 'recipe43', :id => '43', :origin_id => '43')
          recipe44 = FactoryGirl.create(:recipe, :name => 'recipe44', :id => '44', :origin_id => '44')
          recipe45 = FactoryGirl.create(:recipe, :name => 'recipe45', :id => '45', :origin_id => '45')
          recipe46 = FactoryGirl.create(:recipe, :name => 'recipe46', :id => '46', :origin_id => '46')
          recipe47 = FactoryGirl.create(:recipe, :name => 'recipe47', :id => '47', :origin_id => '47')
          recipe48 = FactoryGirl.create(:recipe, :name => 'recipe48', :id => '48', :origin_id => '48')
          recipe49 = FactoryGirl.create(:recipe, :name => 'recipe49', :id => '49', :origin_id => '49')
          recipe50 = FactoryGirl.create(:recipe, :name => 'recipe50', :id => '50', :origin_id => '50')
          recipe51 = FactoryGirl.create(:recipe, :name => 'recipe51', :id => '51', :origin_id => '51')
          recipe52 = FactoryGirl.create(:recipe, :name => 'recipe52', :id => '52', :origin_id => '52')
          recipe53 = FactoryGirl.create(:recipe, :name => 'recipe53', :id => '53', :origin_id => '53')
          recipe54 = FactoryGirl.create(:recipe, :name => 'recipe54', :id => '54', :origin_id => '54')
          recipe55 = FactoryGirl.create(:recipe, :name => 'recipe55', :id => '55', :origin_id => '55')
          recipe56 = FactoryGirl.create(:recipe, :name => 'recipe56', :id => '56', :origin_id => '56')
          recipe57 = FactoryGirl.create(:recipe, :name => 'recipe57', :id => '57', :origin_id => '57')
          recipe58 = FactoryGirl.create(:recipe, :name => 'recipe58', :id => '58', :origin_id => '58')
          recipe59 = FactoryGirl.create(:recipe, :name => 'recipe59', :id => '59', :origin_id => '59')
          recipe60 = FactoryGirl.create(:recipe, :name => 'recipe60', :id => '60', :origin_id => '60')
          recipe61 = FactoryGirl.create(:recipe, :name => 'recipe61', :id => '61', :origin_id => '61')
          recipe62 = FactoryGirl.create(:recipe, :name => 'recipe62', :id => '62', :origin_id => '62')
          recipe63 = FactoryGirl.create(:recipe, :name => 'recipe63', :id => '63', :origin_id => '63')
          recipe64 = FactoryGirl.create(:recipe, :name => 'recipe64', :id => '64', :origin_id => '64')
          recipe65 = FactoryGirl.create(:recipe, :name => 'recipe65', :id => '65', :origin_id => '65')
          recipe66 = FactoryGirl.create(:recipe, :name => 'recipe66', :id => '66', :origin_id => '66')
          recipe67 = FactoryGirl.create(:recipe, :name => 'recipe67', :id => '67', :origin_id => '67')
          recipe68 = FactoryGirl.create(:recipe, :name => 'recipe68', :id => '68', :origin_id => '68')
          recipe69 = FactoryGirl.create(:recipe, :name => 'recipe69', :id => '69', :origin_id => '69')
          recipe70 = FactoryGirl.create(:recipe, :name => 'recipe70', :id => '70', :origin_id => '70')
          recipe71 = FactoryGirl.create(:recipe, :name => 'recipe71', :id => '71', :origin_id => '71')
          recipe72 = FactoryGirl.create(:recipe, :name => 'recipe72', :id => '72', :origin_id => '72')
          recipe73 = FactoryGirl.create(:recipe, :name => 'recipe73', :id => '73', :origin_id => '73')
          recipe74 = FactoryGirl.create(:recipe, :name => 'recipe74', :id => '74', :origin_id => '74')
          recipe75 = FactoryGirl.create(:recipe, :name => 'recipe75', :id => '75', :origin_id => '75')
          recipe76 = FactoryGirl.create(:recipe, :name => 'recipe76', :id => '76', :origin_id => '76')
          recipe77 = FactoryGirl.create(:recipe, :name => 'recipe77', :id => '77', :origin_id => '77')
          recipe78 = FactoryGirl.create(:recipe, :name => 'recipe78', :id => '78', :origin_id => '78')
          recipe79 = FactoryGirl.create(:recipe, :name => 'recipe79', :id => '79', :origin_id => '79')
          recipe80 = FactoryGirl.create(:recipe, :name => 'recipe80', :id => '80', :origin_id => '80')
          recipe81 = FactoryGirl.create(:recipe, :name => 'recipe81', :id => '81', :origin_id => '81')
          recipe82 = FactoryGirl.create(:recipe, :name => 'recipe82', :id => '82', :origin_id => '82')
          recipe83 = FactoryGirl.create(:recipe, :name => 'recipe83', :id => '83', :origin_id => '83')
          recipe84 = FactoryGirl.create(:recipe, :name => 'recipe84', :id => '84', :origin_id => '84')
          recipe85 = FactoryGirl.create(:recipe, :name => 'recipe85', :id => '85', :origin_id => '85')
          recipe86 = FactoryGirl.create(:recipe, :name => 'recipe86', :id => '86', :origin_id => '86')
          recipe87 = FactoryGirl.create(:recipe, :name => 'recipe87', :id => '87', :origin_id => '87')
          recipe88 = FactoryGirl.create(:recipe, :name => 'recipe88', :id => '88', :origin_id => '88')
          recipe89 = FactoryGirl.create(:recipe, :name => 'recipe89', :id => '89', :origin_id => '89')
          recipe90 = FactoryGirl.create(:recipe, :name => 'recipe90', :id => '90', :origin_id => '90')
          recipe91 = FactoryGirl.create(:recipe, :name => 'recipe91', :id => '91', :origin_id => '91')
          recipe92 = FactoryGirl.create(:recipe, :name => 'recipe92', :id => '92', :origin_id => '92')
          recipe93 = FactoryGirl.create(:recipe, :name => 'recipe93', :id => '93', :origin_id => '93')
          recipe94 = FactoryGirl.create(:recipe, :name => 'recipe94', :id => '94', :origin_id => '94')
          recipe95 = FactoryGirl.create(:recipe, :name => 'recipe95', :id => '95', :origin_id => '95')
          recipe96 = FactoryGirl.create(:recipe, :name => 'recipe96', :id => '96', :origin_id => '96')
          recipe97 = FactoryGirl.create(:recipe, :name => 'recipe97', :id => '97', :origin_id => '97')
          recipe98 = FactoryGirl.create(:recipe, :name => 'recipe98', :id => '98', :origin_id => '98')
          recipe99 = FactoryGirl.create(:recipe, :name => 'recipe99', :id => '99', :origin_id => '99')
          user1 = FactoryGirl.create(:user, :username => 'user1', :password_digest => '123')
          session[:return_to] = '/recipes/page/3'
          session[:user_id] = 1
          post :favorite, {:id => 1, :positive => "true"}
          get :page, {:id => 3}
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
          recipe1 = FactoryGirl.create(:recipe, :name => 'recipe1', :id => '1', :origin_id => '12345')
          user1 = FactoryGirl.create(:user, :username => 'user1', :password_digest => '123')
          session[:return_to] = '/recipes/page/1'
          session[:user_id] = 1
          post :favorite, {:id => 1, :positive => "true"}
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