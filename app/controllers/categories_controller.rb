class CategoriesController < ApplicationController
  def index
    @parents = Category.order("id ASC").limit(13)
  end
 
end
