class CategoriesController < ApplicationController


    def index
        @categories = Category.all
      end
    
      def show
        @category = Category.find(params[:id])
        @product = @category.products
      end


#   def show
#   end

#   def new
#   end

#   def edit
#   end

#   def create
#   end

#   def update
#   end

#   def destroy
#   end
end