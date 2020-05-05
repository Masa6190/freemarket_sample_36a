class ItemsController < ApplicationController

  #商品削除・編集機能実装の際に、書いたものでまだ未完成の為一旦コメントアウトしています。
  # before_action :set_category, only: [:new, :create, :edit, :update]
  before_action :set_item, except: [:index, :new, :create]


  def index
    @items = Item.all
    sold_out_item_ids = Buyer.all.pluck(:item_id)
    @item = Item.order(id: "DESC").where.not(id: sold_out_item_ids).first(3)
  end

  def show
  end

  def new
    
    @item = Item.new
    @item.images.new
    
    #セレクトボックスの初期値設定
    @category_parent_array = []
    @category_children = []
    # categoriesテーブルから親カテゴリーのみを抽出、配列に格納
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent
    end
  end
  
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find(params[:category_id]).children
  end
 

  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end 


  def create
    @item = Item.new(item_params)
    if @item.save!
      redirect_to items_path
    else
      redirect_to new_product_path,data: { turbolinks: false }
      @category_parent_array = []
      # categoriesテーブルから親カテゴリーのみを抽出、配列に格納
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent
      end
      render :new
    end  
  end

  def edit
    @item = Item.find(params[:id])
    @category_parent_array = []
      # categoriesテーブルから親カテゴリーのみを抽出、配列に格納
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent
    end
  end


  def update
    item = Item.find(params[:id])
    
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :status_id, :burden_id, :area_id, :days_to_ship_id, :selling_price, :category_id, :brand, images_attributes: [:image, :_destroy, :id]).merge(saler_id: current_user.id) 
  end


  

  #商品削除・編集機能実装の際に、書いたものでまだ未完成の為一旦コメントアウトしています。
  def set_item
    @item = Item.find(params[:id])
  end
  
  #商品削除・編集機能実装の際に、書いたものでまだ未完成の為一旦コメントアウトしています。
  # def set_category
  #   @category_parent_arrays = CategoryParentArray.all.order("id ASC").limit(13)
  # end
end
