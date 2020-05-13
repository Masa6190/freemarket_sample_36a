require 'rails_helper'

describe Card do
  describe '#create' do

    # 1
    it "user_id,customer_id,card_idが存在すれば登録できること" do
      card = build(:card)
      expect(card).to be_valid
    end

    # 2
    it "user_idがない場合は登録できないこと" do
      card = build(:card, user: nil)
      card.valid?
      expect(card.errors[:user]).to include("must exist")
    end

    # 3
    it "customer_idがない場合は登録できないこと" do
      card = build(:card, customer_id: nil)
      card.valid?
      expect(card.errors[:customer_id]).to include("can't be blank")
    end
    
    # 4
    it "card_idがない場合は登録できないこと" do
      card = build(:card, card_id: nil)
      card.valid?
      expect(card.errors[:card_id]).to include("can't be blank")
    end
    
  end
end