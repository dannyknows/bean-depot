class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_cart
  before_action :find_product

  def cart
    @current_cart = @cart.cart_products
    @cart_total =  0
    @current_cart.each do |p|
      @cart_total += p.product.price 
    end 
    @cart_total
  end

  def add_product
    CartProduct.create(
    cart_id: @cart.id,
    product_id: params[:product_id]
    )
    flash[:success] = "added to cart 🛒"
    redirect_to request.referer
  end

  def remove_product
    product = @cart.cart_products.find_by(product_id: @product) 
    CartProduct.delete(product.id)
    redirect_to cart_path
  end

  private 

  def find_cart
    @cart = Cart.find_by(user_id: current_user.id)
  end

  def find_product
    @product = params[:product_id]
  end

end
