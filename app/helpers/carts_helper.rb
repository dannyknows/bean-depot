module CartsHelper
  def display_price(int)
    ActionController::Base.helpers.number_to_currency(int / 100.00)
  end

  def total(cart)
    total = 0
    cart.each do |cart|
      total += cart.product.price
    end
    display_price(total)
  end
end
