class ProductsController < ApplicationController

  before_action :set_filter_query_params, only: [:index]

  def index
    @search = current_user.products.ransack(params[:q])
    @products = params[:q].present? ? @search.result : @search.result.limit(25)

    respond_to do |format|
      format.xlsx {
        response.headers[
          'Content-Disposition'
        ] = "attachment; filename='products.xlsx'"
      }
      format.html { render :index }
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private

    def set_filter_query_params
      @filter_query = {}
      if params[:q]
        params.permit!
        @filter_query = params[:q].to_h
      end
    end

end