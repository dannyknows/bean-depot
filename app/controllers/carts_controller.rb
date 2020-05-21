class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_cart
  before_action :find_product

  def cart
    @current_cart = @cart.cart_products if @cart.cart_products 

    @cart_total = 0
    @current_cart.each do |p|
      @cart_total += p.product.price
    end
    @cart_total
  end

  def add_product
    CartProduct.create(
      cart_id: @cart.id,
      product_id: @product
    )
    flash[:success] = "🛒 added to cart"
    redirect_to root_path
  end

  def remove_product
    product = @cart.cart_products.find_by(product_id: @product)
    CartProduct.delete(product.id)
    flash[:success] = "🗑 removed from cart"
    redirect_to cart_path
  end

  private

  def find_cart
    if current_user.carts.empty? || current_user.carts.pluck(:fulfilled).last
       current_user.carts.create
    end
    @cart = Cart.find_by(user_id: current_user.id, fulfilled: false)
  end

  def find_product
    @product = params[:product_id]
  end
end
