class CategoriesController < ApplicationController
  def index
    @parents = Category.order("id ASC").limit(13)
  end

  # def show 
  #   @category = Category.find(params[:id])
  #   @items = @category.items.order('created_at DESC').page(params[:page]).per(5)
  # end
end
