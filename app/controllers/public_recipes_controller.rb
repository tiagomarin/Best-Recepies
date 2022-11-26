class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.includes(%i[user recipe_foods foods]).where(public: true)
  end
end
