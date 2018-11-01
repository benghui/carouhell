class OffersController < ApplicationController


    def create
        @offer = Offer.new(offer_params)
        @offer.save

        redirect_to user_product_path(user_id: current_user.id, id: @offer.id)
      end
    
    def approve
        authorize @offer
        @offer = Offer.find(params[:id])

        if @offer.approved?
            @offer.update_attribute(:approved, false)
          else
            @offer.update_attribute(:approved, true)
          end
        redirect_to user_product_path
    end
    

    private

    def offer_params
        params.require(:offer).permit(:product_name, :price, :message, :transaction_method, :meetup_location, :approve, :user_id, :product_id)
    end

end 

# before_action :set_agency, only: [:show, :edit, :update, :destroy, :approve]