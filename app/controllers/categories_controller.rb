class CategoriesController < ApplicationController

    def index
      @categories = Category.all
    end
  
    private
  
    def category_params
      params.require(:category).permit(:product_category)
    end
  end