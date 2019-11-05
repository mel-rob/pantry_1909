require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'
require './lib/pantry'

class PantryTest < Minitest::Test

  def setup
    @pantry = Pantry.new
    @cheese = Ingredient.new("Cheese", "C", 100)
    @mac = Ingredient.new("Macaroni", "oz", 30)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
  end

  def test_it_exists
    assert_instance_of Pantry, @pantry
  end

  def test_it_has_stock
    expected = {}
    assert_equal expected, @pantry.stock
  end

  def test_it_can_stock_check
    assert_equal 0, @pantry.stock_check(@cheese)
  end

  def test_it_can_restock
    assert_equal 0, @pantry.stock_check(@cheese)

    @pantry.restock(@cheese, 5)
    assert_equal 5, @pantry.stock_check(@cheese)

    @pantry.restock(@cheese, 10)
    assert_equal 15, @pantry.stock_check(@cheese)
  end

  def test_it_can_check_enough_ingredients
    @pantry.restock(@cheese, 10)
    assert_equal false, @pantry.enough_ingredients_for?(@mac_and_cheese)

    @pantry.restock(@mac, 7)
    assert_equal false, @pantry.enough_ingredients_for?(@mac_and_cheese)

    @pantry.restock(@mac, 1)
    assert_equal true, @pantry.enough_ingredients_for?(@mac_and_cheese)
  end
end
