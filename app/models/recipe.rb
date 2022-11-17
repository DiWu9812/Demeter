class Recipe < ActiveRecord::Base
    attr_accessor :favorited
    attr_writer :favorited
    # validates_uniqueness_of :name
    belongs_to :cuisine
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
end
