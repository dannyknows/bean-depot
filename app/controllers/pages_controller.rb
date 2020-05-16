class PagesController < ApplicationController
  # load_and_authorize_resource

  def index
    @products = Product.all
  end
  
  def showcase
    @product = Product.find_by(id: params[:id])
  end

end
