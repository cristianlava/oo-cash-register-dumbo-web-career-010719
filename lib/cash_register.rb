require 'pry'
class CashRegister
  attr_accessor :discount, :price, :title, :transaction
  attr_writer :total
  def initialize(discount = 20, total = 0)
    @total = total
    @discount = discount
    @bag = []
  end

  def total
    @total
  end

  def add_item(title, price, quantity = 1)

    @title = title
    @quantity = quantity
    @price = price
    self.total += (@price * @quantity)
    @quantity.times {@bag << title}
  end

  def apply_discount
    if @quantity
      item_discount = (@price * @discount) / 100.to_i
      self.total -= item_discount
      # binding.pry
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @bag
  end

  def void_last_transaction
    # binding.pry
    @total -= self.price
  end
end
