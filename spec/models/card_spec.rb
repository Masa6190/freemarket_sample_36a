require 'rails_helper'

describe Card do
  describe '#create' do
    # 1
    it "user_idがない場合は登録できないこと" do
      card = build(:card, user_id: nil)
      card.valid?
      expect(card.errors[:user_id]).to include("can't be blank")
    end

    # 2
    it "customer_idがない場合は登録できないこと" do
      card = build(:card, customer_id: nil)
      card.valid?
      expect(card.errors[:customer_id]).to include("can't be blank")
    end
    # 3
    it "card_idがない場合は登録できないこと" do
      card = build(:card, card_id: nil)
      card.valid?
      expect(item.errors[:card_id]).to include("can't be blank")
    end
    
  end
end