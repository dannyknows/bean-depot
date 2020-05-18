class Product < ApplicationRecord
  belongs_to :producer
  belongs_to :origin
  has_one_attached :image
  enum grind_type: { AEROPRESS: 0, COLD_BREW: 1, ESPRESSO: 2, PLUNGER: 3 }
end
