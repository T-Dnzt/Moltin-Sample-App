class ProductsController < ApplicationController
  def index
    offset = params[:page] ? (params[:page].to_i - 1) * 12 : 0
    @products = moltin.products.all.
                                limit(12).
                                offset(offset).
                                sort('name').
                                with(:files).filter(eq: { status: 'live' })
    @page = @products.response_meta['page']
  end

  def show
    @product = moltin.products.get(params[:id]).with(:files)
  end
end
