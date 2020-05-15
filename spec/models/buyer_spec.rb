require 'rails_helper'

describe Buyer do
  describe '#create' do

    # 1
    it "user_idが空では登録できない " do
      buyer = build(:buyer, user: nil)
      buyer.valid?
      expect(buyer.errors[:user]).to include("ユーザー情報は空です")
    end

    # 2
    it "item_idが空では登録できない " do
      buyer = build(:buyer, item: nil)
      buyer.valid?
      expect(buyer.errors[:item]).to include("商品情報は空です")
    end

    # 3
    it "user_id,item_idが存在すれば登録できること" do
      buyer = build(:buyer)
      expect(buyer).to be_valid
    end
  end
end