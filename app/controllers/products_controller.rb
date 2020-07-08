class ProductsController < ApplicationController

  def index
    @products = current_user.products.order(created_at: :desc).limit(25)
  end

  def show
    @product = Product.find(params[:id])
  end

end