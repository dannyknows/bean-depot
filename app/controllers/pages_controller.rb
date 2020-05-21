class PagesController < ApplicationController
  before_action :get_products

  def index
  end

  def showcase
   @product = @products.find_by(id: params[:id])
  end

  private 
  
  def get_products
    @products = Product.all
  end
end
