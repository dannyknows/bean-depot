class ProductsController < ApplicationController
  before_action :find_product, only: [:edit, :update]
  before_action :product_params, only: [:update, :create, :destroy]
  
  def listings
    @products = Product.where(producer_id: current_user.producer)
  end
  
  def show
  end

  def new
    #TODO - REMOVE
    puts '*' * 30
    puts ' ' 
    print 'DEBUG: '
    pp @product = Product.new
    puts ' ' 
    puts '*' * 30
    #TODO - REMOVE
  end

  def create 
  #TODO - REMOVE
  puts '*' * 30
  puts ' ' 
  print 'DEBUG: '
  pp @product = current_user.producer.products.create(product_params)
  puts ' ' 
  puts '*' * 30
  #TODO - REMOVE
    
    # flash[:success] = "You successfully created a new listing!"
    # edirect_to showcase_path(@product.id)
  end

  def edit
  end

  def update
    @product.update(product_params)
    redirect_to showcase_path(@product.id)
  end

  private

  def product_params
    product_params = params.require(:product).permit(:name, :description, :price, :origin_id, :grind_type, :isDecaf, :picture)
  end

  def find_product
    @product = Product.find_by(id: params[:id])
  end
  
end
