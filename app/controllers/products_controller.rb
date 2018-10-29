class ProductsController < ApplicationController


  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all
  end

  def create
    @product = Product.new(product_params)
    @product.seller = current_user

    @product.save
    redirect_to @product
  end

  def update
    @product = Product.find(params[:id])
    @product.seller = current_user

    @product.update(product_params)
    redirect_to @product
  end

#   def destroy
#   end

private
  def product_params
    params.require(:product).permit(:product_name, :price, :seller_id, :buyer_id, :category_id, :description, :image_url)
  end
end