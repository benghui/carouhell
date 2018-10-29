class ProductsController < ApplicationController


  def index
    @products = Product.all
  end

  def show
     @product = Product.find(params[:id])

  end

    def new
      @categories = Category.all
    end

  def edit
    @product = Product.find(params[:id])
  end

  def create

    @product = Product.new(product_params)
    @product.user = current_user

    @product.save
    redirect_to @products
  end

  def update
     @product = Product.find(params[:id])

    @product.update(product_params)
    redirect_to @product
  end

#   def destroy
#   end

private
  def product_params
    params.require(:product).permit(:product_name, :price, :seller_id, :buyer_id, :category_id, :description, :image_url, :user_id)
  end
end