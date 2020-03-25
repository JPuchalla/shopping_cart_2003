require 'minitest/autorun'
require 'minitest/pride'
require './lib/product'

class ProductTest < Minitest::Test
  def setup
    @product = Product.new(:paper, 'toilet paper', 3.70, '10')
    @product2 = Product.new(:meat, 'chicken', 4.50, '2')
  end

  def test_it_exists

    assert_instance_of Product, @product
  end

  def test_it_has_a_category

    assert_equal :paper, @product.category
  end

  def test_it_has_a_name

    assert_equal 'toilet paper', @product.name
  end

  def test_it_has_a_unit_price

    assert_equal 3.70, @product.unit_price
  end

  def test_it_has_a_quantity

    assert_equal 10, @product.quantity
  end

  def test_it_can_get_total_price

    assert_equal 37.0, @product.total_price
    assert_equal 9.0, @product2.total_price
  end

  def test_if_product_is_hoarded
    
    assert_equal false, @product.is_hoarded?
    @product.hoard
    assert_equal true, @product.is_hoarded?
  end
end
