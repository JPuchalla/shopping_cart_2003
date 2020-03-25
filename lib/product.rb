class Product
  attr_reader :category, :name, :unit_price, :quantity, :total_price
  def initialize(category, name, unit_price, quantity)
    @category = category
    @name = name
    @unit_price = unit_price
    @quantity = quantity
    @hoard = false
  end


  def quantity
    @quantity.to_i
  end

  def total_price
    @unit_price * @quantity.to_f
  end

  def is_hoarded?
    @hoard
  end

  def hoard
    @hoard = true
  end

end
