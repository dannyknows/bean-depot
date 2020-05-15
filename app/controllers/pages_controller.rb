class PagesController < ApplicationController
  # before_action :current_user
  before_action :authenticate_user!, only: [:profile, :cart]

  def index
    @products = Product.all
  end

  def cart
    cart = Cart.find_by(user_id: current_user.id)
    @current_cart = cart.cart_products
  end

  def showcase
    @product = Product.find_by(id: params[:id])
  end
  
  private 
  
end
