class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def fname_required?
    true
  end
  # has_many :products, through: :cart
  has_one :producer
  has_many :carts
  has_many :products, through: :cart_products
end
