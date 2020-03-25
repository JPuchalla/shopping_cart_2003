require 'minitest/autorun'
require 'minitest/pride'
require './lib/product'
require './lib/shopping_cart'

class ShoppingCartTest < Minitest::Test
  def setup
  @cart = ShoppingCart.new("King Soopers", "30items")
  @product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
  @product2 = Product.new(:meat, 'chicken', 4.50, '2')
  @product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
  @product4 = Product.new(:produce, 'apples', 0.99, '20')
  end

  def test_it_exists
    assert_instance_of ShoppingCart, @cart

  end

  def test_it_can_get_attributes
    assert_equal 'King Soopers', @cart.name
    assert_equal 30, @cart.capacity
    assert_equal [], @cart.products
  end


  def test_it_can_add_product_to_cart
    assert_equal [@product1], @cart.add_product(@product1)
    assert_equal [@product1, @product2], @cart.add_product(@product2)
    assert_equal [@product1, @product2], @cart.products
  end

  def test_if_cart_can_measure_total_number_of_products
    assert_equal [@product1], @cart.add_product(@product1)
    assert_equal [@product1, @product2], @cart.add_product(@product2)
    assert_equal [@product1, @product2, @product3], @cart.add_product(@product3)
    assert_equal 13, @cart.total_number_of_products
  end

  def test_if_cart_is_full

    assert_equal [@product1], @cart.add_product(@product1)
    assert_equal [@product1, @product2], @cart.add_product(@product2)
    assert_equal [@product1, @product2, @product3], @cart.add_product(@product3)
    assert_equal false, @cart.is_full?
    assert_equal [@product1, @product2, @product3, @product4], @cart.add_product(@product4)
  end

  def test_if_it_can_retrieve_products_by_category
    assert_equal [@product1], @cart.add_product(@product1)
    assert_equal [@product1, @product2], @cart.add_product(@product2)
    assert_equal [@product1, @product2, @product3], @cart.add_product(@product3)
    assert_equal [@product1, @product2, @product3, @product4], @cart.add_product(@product4)
    assert_equal [@product1, @product3], @cart.products_by_category(:paper)

  end

  def test_if_it_can_retrieve_cart_details
    assert_equal [@product1], @cart.add_product(@product1)
    assert_equal [@product1, @product2], @cart.add_product(@product2)
    assert_equal [@product1, @product2, @product3], @cart.add_product(@product3)
    assert_equal [@product1, @product2, @product3, @product4], @cart.add_product(@product4)

    assert_equal ({:name=>"King Soopers", :capacity=>"30items"}), @cart.details


  end

end
