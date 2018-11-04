class OffersController < ApplicationController

    def new
        @offer = Offer.new
        @product = Product.find(params[:product_id])        
    end

    def create    
        @offer = Offer.new(offer_params)
        @offer.user = current_user
        @offer.product = Product.find(params[:product_id])
        @offer.save

        redirect_to user_product_path(user_id: current_user.id, id: params[:product_id])
    end

    def update   
        @product = Product.find(params[:product_id])
        @product.update_attributes(buyer_id: params[:user_id])
        @offer = Offer.find(params[:offer_id])
        @offer.update_attributes(approve: true)
        redirect_to user_product_path(user_id: current_user.id, id: params[:product_id])
    end


    private

    def offer_params
        params.require(:offer).permit(:remarks, :price, :transaction_method, :meetup_location, :approve, :user_id, :product_id)
    end

end 
