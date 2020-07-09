class ProductsController < ApplicationController

  def index
    @search = current_user.products.search(params[:q])
    @products = params[:q].present? ? @search.result : @search.result.limit(10)
    @search.build_condition
  end

  def show
    @product = Product.find(params[:id])
  end

end