class Product < ApplicationRecord
  belongs_to :producer
  belongs_to :origin
  enum grind_type: { AEROPRESS: 0, COLD_BREW: 1, ESPRESSO: 2, PLUNGER: 3 }
  def display_price
    ActionController::Base.helpers.number_to_currency(self.price)
  end
end
