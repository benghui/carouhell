class ProductsController < ApplicationController
  
  helper_method :sort_column, :sort_direction
  before_action :authenticate_user!, :except => [ :show, :index ]
  
  def index
    if Category.find_by_id(params[:category_id])
      @products = Product.where(category_id: params[:category_id]).order(sort_column + ' ' + sort_direction)
    else 
      @products = Product.order(sort_column + ' ' + sort_direction)
    end
  end

  def show
    @product = Product.find(params[:id])
    @comments = Comment.where(product_id: params[:id])

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

    uploaded_file = params[:product][:image_url].path
    cloudinary_file = Cloudinary::Uploader.upload(uploaded_file)

    params[:product][:image_url] = cloudinary_file['public_id']

    @product = Product.new(product_params)
    @product.seller = current_user


    @product.save
    redirect_to user_product_path(user_id: current_user.id, id: @product.id)
  end

  def update

    @product = Product.find(params[:id])

    uploaded_file = params[:product][:image_url].path
    cloudinary_file = Cloudinary::Uploader.upload(uploaded_file)

    params[:product][:image_url] = cloudinary_file['public_id']

    @product.seller = current_user

    @product.update(product_params)
    redirect_to user_product_path(user_id: current_user.id, id: @product.id)
  end

  def buy
    @product = Product.find(params[:product_id])

    @product.update_attributes(buyer_id: params[:user_id])
    redirect_to user_product_path(user_id: current_user.id, id: @product.id)
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to user_products_path
  end

private
  def product_params
    params.require(:product).permit(:product_name, :price, :seller_id, :buyer_id, :category_id, :description, :image_url)
  end

  def sort_column
    Product.column_names.include?(params[:sort]) ? params[:sort]: "product_name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction]: "asc"
  end
end