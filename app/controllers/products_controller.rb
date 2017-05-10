class ProductsController < ApplicationController
  def index
    offset = params[:page] ? params[:page].to_i * 10 : 0
    @products = moltin.products.all.limit(10).sort('name').offset(offset).with(:files).filter({
      eq: { status: 'live' }
    })
  end

  def show
    @product = moltin.products.get(params[:id]).with(:files)
  end
end
