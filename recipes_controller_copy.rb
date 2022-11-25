class RecipesController < ApplicationController
  load_and_authorize_resource
  before_action :set_recipe, only: %i[home show edit update destroy]
  before_action :set_recipe_foods, only: %i[home show edit update destroy]
  before_action :set_public_recipes
  before_action :set_recipe_costs

  # GET /recipes or /recipes.json
  def home; end

  def index
    @recipes = Recipe.all.where(user_id: current_user.id)
  end

  # GET /recipes/1 or /recipes/1.json
  def show; end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit; end

  # POST /recipes or /recipes.json
  def create
    @recipe = current_user.recipes.build(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to user_recipe_path(current_user, @recipe), notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to user_recipes_path(current_user), notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to user_recipes_path, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_public_recipes
    @public_recipes = Recipe.where(public: true)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def set_recipe_foods
    @recipe_foods = RecipeFood.where(recipe_id: @recipe.id)
  end

  def set_recipe_costs
    @recipe_costs = []
    @public_recipes.each do |recipe|
      recipe_cost = 0
      recipe.foods.each do |food|
        recipe_cost += food.price * food.quantity
      end
      @recipe_costs.push({ recipe_id: recipe.id, cost: recipe_cost })
    end
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public, :user_id)
  end
end
