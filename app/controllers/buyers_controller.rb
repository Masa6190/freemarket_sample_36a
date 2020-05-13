class BuyersController < ApplicationController

  require 'payjp' #Payjpの読み込み
  before_action :authenticate_user!, :set_card, :set_item, :set_address

  def index
    if @card.blank?

    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]                            #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(@card.customer_id)              #保管したカードIDでpayjpから情報取得、
      @default_card_information = customer.cards.retrieve(@card.card_id)  #カード情報表示のためインスタンス変数に代入
    end

  end

  def pay
    if @card.blank? 
      redirect_to new_card_path, alert:'お支払い方法を登録してください' and return
    else

    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      amount: @item.selling_price,         #支払金額を引っ張ってくる
      customer: @card.customer_id,         #顧客ID
      currency: 'jpy',                     #日本円
  )
    end
    redirect_to done_buyers_path #購入確定画面に移動
  end

  def done
  end

  private

  def set_card
    @card = Card.find_by(user_id: current_user.id)   #カードテーブルからpayjpの顧客IDを検索
  end

  def set_address
    @address = Address.find_by(id: current_user.id)  #アドレステーブルからIDを検索
  end

  def set_item
    @item = Item.find(params[:id])                   #アイテムテーブルから情報を取得する
  end

end