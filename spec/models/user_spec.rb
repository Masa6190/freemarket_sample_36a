require 'rails_helper'

describe User do
  describe '#create' do
    # 1
    it "nickname,email,encrypted_passwordが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    # 2
    it "nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    # 3
    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    # 4
    it "encrypted_passwordがない場合は登録できないこと" do
      user = build(:user, encrypted_password: nil)
      user.valid?
      expect(user.errors[:encrypted_password]).to include("を入力してください")
    end

    # 5
    it "encrypted_passwordが6文字以下では登録できないこと" do
      user = build(:user, encrypted_password: "123456")
      user.valid?
      expect(user.errors[:encrypted_password]).to include("は7文字以上で入力してください")
    end

    it "encrypted_passwordが7文字以上で登録できること" do
      user = build(:user, encrypted_password: "1234567")
      user.valid?
      expect(user).to be_valid
    end

    # 6
    it "重複したemailが存在する場合登録できない" do
      #はじめにユーザーを登録
      user = create(:user)
      #先に登録したユーザーと同じemailの値をもつユーザーのインスタンスを作成
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    # 7
    it "emailに＠が含まれていないと登録できない" do
      user = build(:user, email: "aaaagmail.com")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "emailにドメインが含まれていないと登録できない" do
      user = build(:user, email: "aaaa@")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    # 8
    it "passwordとpassword_confirmationが一致していると登録できる " do
      user = build(:user, password: "a123456", password_confirmation: "a123456")
      user.valid?
      expect(user).to be_valid
    end

    it "passwordとpassword_confirmationが一致していないと登録できない " do
      user = build(:user, password: "a123456", password_confirmation: "b987654")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end
  end
end