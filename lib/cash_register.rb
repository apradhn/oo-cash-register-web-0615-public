require "pry"

class CashRegister
  attr_accessor :total
  attr_reader :discount, :items

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    apply_discount if discount > 0
  end

  def add_item(item, price, quantity=1)
    quantity.times {|i| @items << item}
    @total += price*quantity
  end

  def apply_discount
    if total == 0.0
      "There is no discount to apply."
    else
      @total -= @total*(discount_percent)
      "After the discount, the total comes to $#{@total.round}."
    end
  end

  def discount_percent
    @discount * 0.01
  end

end