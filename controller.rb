require_relative "view"
require_relative "recipe"
require_relative "cookbook"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    display_recipes
  end

  def create
    name = @view.ask_user_for_recipe
    description = @view.ask_user_for_description
    recipe = Recipe.new(name, description)
    @cookbook.add_recipe(recipe)
  end

  def destroy
    display_recipes
    recipe_index = @view.ask_user_for_index
    @cookbook.remove_recipe(recipe_index)
    display_recipes
  end

  def display_recipes
    recipes = @cookbook.all
    @view.display(recipes)
  end
end
