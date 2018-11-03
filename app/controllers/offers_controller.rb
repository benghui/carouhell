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
    
    # def approve
    #     authorize @offer
    #     @offer = Offer.find(params[:id])

    #     if @offer.approved?
    #         @offer.update_attribute(:approved, false)
    #       else
    #         @offer.update_attribute(:approved, true)
    #       end
    #     redirect_to user_product_path
    # end
    private

    def offer_params
        params.require(:offer).permit(:remarks, :price, :transaction_method, :meetup_location, :approve, :user_id, :product_id)
    end

end 

# before_action :set_agency, only: [:show, :edit, :update, :destroy, :approve]