class RecipesController < ApplicationController
  load_and_authorize_resource
  before_action :set_recipe_food, only: %i[show edit update destroy]
  before_action :set_recipe
  before_action :set_user
end