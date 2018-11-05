class UsersController < ApplicationController

  def show
    if current_user
        @user = User.find(params[:id])
        @listedproducts = Product.where(seller_id: params[:id])
        @orderhistory = Product.where(buyer_id: params[:id])
        @offers = Offer.where() # product.seller_id == current_user 

    else 
      redirect_to new_user_session_path
    end
  end


  
end