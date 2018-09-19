require 'pry'

class CashRegister
  attr_accessor :total, :discount, :title, :price, :quantity, :items, :last_transaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end # end initialize method

  def add_item(title, price, quantity = 1)
    self.total += (price * quantity)
    quantity.times {items << title} # runs the block for however many times quantity is ex 2.times
    self.last_transaction = price * quantity #every time this method is run it will save the last item added
  end # end add_item method

  def apply_discount
    if discount != 0
      self.total = (total * (100-discount.to_f)/100.0).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end # end if discount stmt
  end # end apply_discount method

  def void_last_transaction
    self.total -= self.last_transaction
  end # end void_last_transaction method

end # end CashRegister class
