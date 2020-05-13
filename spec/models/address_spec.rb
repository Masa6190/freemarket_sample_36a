require 'rails_helper'

describe Address do
  describe '#create' do
    # 1
    it "user_id,familyname,firstname,familyname_kana,firstname_kana,birth_year,birth_month,birth_day,postal_code,prefecture,city,blockが存在すれば登録できること" do
      address = build(:address)
      expect(address).to be_valid
    end

    # 2
    it "familynameがない場合は登録できないこと" do
      address = build(:address, familyname: nil)
      address.valid?
      expect(address.errors[:familyname]).to include("can't be blank")
    end

    # 3
    it "firstnameがない場合は登録できないこと" do
      address = build(:address, firstname: nil)
      address.valid?
      expect(address.errors[:firstname]).to include("can't be blank")
    end

    # 4
    it "familyname_kanaがない場合は登録できないこと" do
      address = build(:address, familyname_kana: nil)
      address.valid?
      expect(address.errors[:familyname_kana]).to include("can't be blank")
    end
    
    # 5
    it "firstname_kanaがない場合は登録できないこと" do
      address = build(:address, firstname_kana: nil)
      address.valid?
      expect(address.errors[:firstname_kana]).to include("can't be blank")
    end

    # 6
    it "birth_yearがない場合は登録できないこと" do
      address = build(:address, birth_year: nil)
      address.valid?
      expect(address.errors[:birth_year]).to include("can't be blank")
    end

    # 7
    it "birth_monthがない場合は登録できないこと" do
      address = build(:address, birth_month: nil)
      address.valid?
      expect(address.errors[:birth_month]).to include("can't be blank")
    end

    # 8
    it "birth_dayがない場合は登録できないこと" do
      address = build(:address, birth_day: nil)
      address.valid?
      expect(address.errors[:birth_day]).to include("can't be blank")
    end
    
    # 9
    it "postal_codeがない場合は登録できないこと" do
      address = build(:address, postal_code: nil)
      address.valid?
      expect(address.errors[:postal_code]).to include("can't be blank")
    end

    # 10
    it "prefectureがない場合は登録できないこと" do
      address = build(:address, prefecture: nil)
      address.valid?
      expect(address.errors[:prefecture]).to include("can't be blank")
    end

    # 11
    it "cityがない場合は登録できないこと" do
      address = build(:address, city: nil)
      address.valid?
      expect(address.errors[:city]).to include("can't be blank")
    end

    # 12
    it "blockがない場合は登録できないこと" do
      address = build(:address, block: nil)
      address.valid?
      expect(address.errors[:block]).to include("can't be blank")
    end

    # 13
    it "familynameが全角でない場合は登録できないこと" do
      address = build(:address, familyname: "aaa")
      address.valid?
      expect(address.errors[:familyname]).to include("は全角で入力して下さい")
    end

    # 14
    it "firstnameが全角でない場合は登録できないこと" do
      address = build(:address, firstname: "bbb")
      address.valid?
      expect(address.errors[:firstname]).to include("は全角で入力して下さい")
    end

    # 15
    it "familyname_kanaが全角カタカナでない場合は登録できないこと" do
      address = build(:address, familyname_kana: "aaa")
      address.valid?
      expect(address.errors[:familyname_kana]).to include("は全角カタカナで入力して下さい")
    end

    # 16
    it "firstname_kanaが全角カタカナでない場合は登録できないこと" do
      address = build(:address, firstname_kana: "bbb")
      address.valid?
      expect(address.errors[:firstname_kana]).to include("は全角カタカナで入力して下さい")
    end
  end
end