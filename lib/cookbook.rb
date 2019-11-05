class CookBook

  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def recipe_hash(recipe)
    recipe_hash = Hash.new{ |hash,k| hash[k] = Hash.new }
    recipe_hash[:name] = recipe.name
    recipe_hash[:details] = ingredient_hash(recipe)
    recipe_hash[:total_calories] = recipe.total_calories
    recipe_hash
  end

  # def ingredient_hash(ingredient)
  #   ingredient_hash = Hash.new{ |hash,k| hash[k] = Hash.new }
  #   ingredient_hash[:ingredients][:ingredient] = key.name
  #   ingredient_hash[:ingredients][:amount] = value.to_s + " " + key.unit
  #   ingredient_hash
  # end

  # def ingredients(recipe)
  #   recipe.ingredients_required.reduce({}) do |acc, ingredient|
  #     ingredient.ingredient_hash(ingredient)
  #     acc
  #   end
  # end

  def ingredient_hash(recipe)
    ingredient_hash = Hash.new{ |hash,k| hash[k] = Hash.new }
    recipe.ingredients_required.each do |key, value|
      ingredient_hash[:ingredients][:ingredient] = key.name
      ingredient_hash[:ingredients][:amount] = value.to_s + " " + key.unit
    end
    ingredient_hash
  end

  def summary
    summary = []
    @recipes.each do |recipe|
      summary << recipe_hash(recipe)
      end
    summary
  end
end
