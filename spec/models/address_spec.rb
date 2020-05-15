require 'rails_helper'

describe Address do
  describe '#create' do
    # 1
    it "user_id,familyname,firstname,familyname_kana,firstname_kana,birth_year,birth_month,birth_day,familyname_deliver,firstname_deliver,familyname_deliver_kana,firstname_deliver_kana,postal_code,prefecture,city,blockが存在すれば登録できること" do
      address = build(:address)
      expect(address).to be_valid
    end

    # 2
    it "familynameがない場合は登録できないこと" do
      address = build(:address, familyname: nil)
      address.valid?
      expect(address.errors[:familyname]).to include("を入力してください")
    end

    # 3
    it "firstnameがない場合は登録できないこと" do
      address = build(:address, firstname: nil)
      address.valid?
      expect(address.errors[:firstname]).to include("を入力してください")
    end

    # 4
    it "familyname_kanaがない場合は登録できないこと" do
      address = build(:address, familyname_kana: nil)
      address.valid?
      expect(address.errors[:familyname_kana]).to include("を入力してください")
    end
    
    # 5
    it "firstname_kanaがない場合は登録できないこと" do
      address = build(:address, firstname_kana: nil)
      address.valid?
      expect(address.errors[:firstname_kana]).to include("を入力してください")
    end

    # 6
    it "birth_yearがない場合は登録できないこと" do
      address = build(:address, birth_year: nil)
      address.valid?
      expect(address.errors[:birth_year]).to include("を入力してください")
    end

    # 7
    it "birth_monthがない場合は登録できないこと" do
      address = build(:address, birth_month: nil)
      address.valid?
      expect(address.errors[:birth_month]).to include("を入力してください")
    end

    # 8
    it "birth_dayがない場合は登録できないこと" do
      address = build(:address, birth_day: nil)
      address.valid?
      expect(address.errors[:birth_day]).to include("を入力してください")
    end

    # 9
    it "familyname_deliverがない場合は登録できないこと" do
      address = build(:address, familyname_deliver: nil)
      address.valid?
      expect(address.errors[:familyname_deliver]).to include("を入力してください")
    end

    # 10
    it "firstname_deliverがない場合は登録できないこと" do
      address = build(:address, firstname_deliver: nil)
      address.valid?
      expect(address.errors[:firstname_deliver]).to include("を入力してください")
    end

    # 11
    it "familyname_deliver_kanaがない場合は登録できないこと" do
      address = build(:address, familyname_deliver_kana: nil)
      address.valid?
      expect(address.errors[:familyname_deliver_kana]).to include("を入力してください")
    end
    
    # 12
    it "firstname_deliver_kanaがない場合は登録できないこと" do
      address = build(:address, firstname_deliver_kana: nil)
      address.valid?
      expect(address.errors[:firstname_deliver_kana]).to include("を入力してください")
    end
    
    # 13
    it "postal_codeがない場合は登録できないこと" do
      address = build(:address, postal_code: nil)
      address.valid?
      expect(address.errors[:postal_code]).to include("を入力してください")
    end

    # 14
    it "prefectureがない場合は登録できないこと" do
      address = build(:address, prefecture: nil)
      address.valid?
      expect(address.errors[:prefecture]).to include("を入力してください")
    end

    # 15
    it "cityがない場合は登録できないこと" do
      address = build(:address, city: nil)
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end

    # 16
    it "blockがない場合は登録できないこと" do
      address = build(:address, block: nil)
      address.valid?
      expect(address.errors[:block]).to include("を入力してください")
    end

    # 17
    it "familynameが全角でない場合は登録できないこと" do
      address = build(:address, familyname: "aaa")
      address.valid?
      expect(address.errors[:familyname]).to include("は全角で入力して下さい")
    end

    # 18
    it "firstnameが全角でない場合は登録できないこと" do
      address = build(:address, firstname: "bbb")
      address.valid?
      expect(address.errors[:firstname]).to include("は全角で入力して下さい")
    end

    # 19
    it "familyname_kanaが全角カタカナでない場合は登録できないこと" do
      address = build(:address, familyname_kana: "aaa")
      address.valid?
      expect(address.errors[:familyname_kana]).to include("は全角カタカナで入力して下さい")
    end

    # 20
    it "firstname_kanaが全角カタカナでない場合は登録できないこと" do
      address = build(:address, firstname_kana: "bbb")
      address.valid?
      expect(address.errors[:firstname_kana]).to include("は全角カタカナで入力して下さい")
    end
  end
end