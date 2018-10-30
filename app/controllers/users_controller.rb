class UsersController < ApplicationController

  def show
    if User.find_by_id(params[:id]).id == current_user.id
        @username = User.find(params[:id]).username
        @listedproducts = Product.where(seller_id: params[:id])
        @orderhistory = Product.where(buyer_id: params[:id])
      else 
        @listedproducts = Product.where(seller_id: params[:id])
      end 
  end

end