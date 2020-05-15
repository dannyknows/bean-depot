class PagesController < ApplicationController
  # before_action :current_user
  before_action :authenticate_user!, only: [:profile]

  def index
    @products = Product.all
  end

  def cart
    if user_signed_in?
      cart = Cart.find_by(user_id: current_user.id)
      @current_cart = cart.cart_products
    else 
       @current_cart = nil
    end
  end

  def showcase
    @product = Product.find_by(id: params[:id])
  end

  def profile
  end

  private 
  
end
