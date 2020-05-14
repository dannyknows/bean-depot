class PagesController < ApplicationController
  def index
    @products = Product.all
    p params
  end
  def cart
    @current_user = User.find_by(id: 7)
    cart = Cart.find_by(user_id: @current_user.id)
    @current_cart = cart.cart_products
  end
  def showcase
    @product = Product.find_by(id: params[:id])
  end
end
