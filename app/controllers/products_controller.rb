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

#   def edit
#   end

  def create

    @product = Product.new(product_params)
    # @product.user = current_user

    @product.save
    redirect_to @products
  end

#   def update
#   end

#   def destroy
#   end

private
  def product_params
    params.require(:product).permit(:product_name, :price, :seller_id, :buyer_id, :category_id, :description, :image_url, :user_id)
  end
end