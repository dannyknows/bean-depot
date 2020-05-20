class ProductsController < ApplicationController
  before_action :find_product, only: [:edit, :update, :destroy]
  
  def index
    @products = Product.where(producer_id: current_user.producer)
  end

  def new
    @product = Product.new
  end

  def create 
    @product = current_user.producer.products.create!(product_params)
    redirect_to showcase_path(@product.id)
  end

  def edit
  end

  def update
    @product.update(product_params)
    redirect_to showcase_path(@product.id)
  end

  def destroy
    Product.destroy(@product.id)
    redirect_to products_path
  end

  private

  def product_params
    product_params = params.require(:product).permit(:name, :description, :price, :origin_id, :grind_type, :isDecaf, :image)
  end

  def find_product
    @product = Product.find_by(id: params[:id])
  end
  
end
