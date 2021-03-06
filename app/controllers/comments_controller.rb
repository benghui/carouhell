class CommentsController < ApplicationController

    before_action :authenticate_user!, :except => [ :show, :index ]

  def new
    @product = Product.find(params[:product_id])
    @comment = Comment.new
  end

  def edit
    @product = Product.find(params[:product_id])
    @comment = Comment.find(params[:id])
    if @comment.user != current_user
      redirect_to @products
    end
  end

  def create
    @comment = Comment.new(comment_params)
    @product = Product.find(params[:product_id])
    @comment.product = @product
    @comment.user = current_user

    if @comment.save
      redirect_to user_product_path(user_id: current_user.id, id: @product.id)
    else
      redirect_to root_path
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @product = @comment.product
    @comment.update(comment_params)

    redirect_to user_product_path(user_id: current_user.id, id: @product.id)
  end

  def destroy
    @comment = Comment.find(params[:id])

    if @comment.user = current_user
      @comment.destroy
      @product = Product.find(params[:product_id])
      redirect_to user_product_path(user_id: current_user.id, id: @product.id)
    else
      @product = Product.find(params[:product_id])
      redirect_to user_product_path(user_id: current_user.id, id: @product.id)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:user_comment, :user_id, :product_id)
  end
end