class ShoppingCart
  attr_reader :name, :capacity, :products
  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @products = []
  end

  def capacity
    @capacity.to_i
  end


  def add_product(item)
    @products << item
  end

  def total_number_of_products
     total_products = 0
     @products.each {|product| total_products += product.quantity}
     total_products
  end

  def is_full?
    total = total_number_of_products
    if total >= 30
      true
    else
      false
    end
  end

  def products_by_category(category)
    product_with_category = []
    @products.flat_map {|product| if product.category == category
      product_with_category << product
      end
    }
    product_with_category
  end

  def details
   cart_details = {name: @name, capacity: @capacity}
   cart_details
  end

end
