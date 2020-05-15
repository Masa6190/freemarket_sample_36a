require 'rails_helper'

describe Item do
  describe '#create' do
    # 1
    it "name、category_id, status_id, text, burden_id, area_id, days_to_ship_id, selling_price, saler_idが存在すれば登録できること" do
      item = build(:item)
      expect(item).to be_valid
    end

    # 2
    it "nameがない場合は登録できないこと" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    # 3
    it "textがない場合は登録できないこと" do
      item = build(:item, text: nil)
      item.valid?
      expect(item.errors[:text]).to include("を入力してください")
    end

    # 4
    it "category_idがない場合は登録できないこと" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end

    # 5
    it "status_idがない場合は登録できないこと" do
      item = build(:item, status_id: nil)
      item.valid?
      expect(item.errors[:status_id]).to include("を入力してください")
    end
    # 6
    it "area_idがない場合は登録できないこと" do
      item = build(:item, area_id: nil)
      item.valid?
      expect(item.errors[:area_id]).to include("を入力してください")
    end
    # 7
    it "burden_idがない場合は登録できないこと" do
      item = build(:item, burden_id: nil)
      item.valid?
      expect(item.errors[:burden_id]).to include("を入力してください")
    end
    # 8
    it "days_to_ship_idがない場合は登録できないこと" do
      item = build(:item, days_to_ship_id: nil)
      item.valid?
      expect(item.errors[:days_to_ship_id]).to include("を入力してください")
    end
    # 9
    it "selling_priceがない場合は登録できないこと" do
      item = build(:item, selling_price: nil)
      item.valid?
      expect(item.errors[:selling_price]).to include("を入力してください")
    end

    # 10
    it " nameが41文字以上であれば登録できないこと" do
      item = build(:item, name: "aaaaaaaaaabbbbbcbbbbbccccccccccdddddddddde")
      item.valid?
      expect(item.errors[:name]).to include("は40文字以内で入力してください")
    end

    # 11
    it "nameが40文字以下では登録できること " do
      item = build(:item, name: "aaaaaa")
      expect(item).to be_valid
    end
    # 12
    it "textが1000文字以下では登録できること " do
      item = build(:item, text: "bbbbbb")
      expect(item).to be_valid
    end
    # 13
    it "selling_priceが9999999以下では登録できること " do
      item = build(:item, selling_price: "8000")
      expect(item).to be_valid
    end
    # 14
    it "selling_priceが300以下では登録できない " do
      item = build(:item, selling_price: "200")
      item.valid?
      expect(item.errors[:selling_price]).to include("は299より大きい値にしてください")
    end
    # 15
    it "saler_idが空では登録できない " do
      item = build(:item, saler_id: "")
      item.valid?
      expect(item.errors[:saler_id]).to include("を入力してください")
    end

  end


# あくまでも学習のために作っているアプリなので、今後のために以下の記述はコメントアウトで残しておく。
# 主にコントローラーのテストを参考サイトより抜粋したもの。そのため変数名など全て違うがこういう書き方をするということ。

# describe 'GET #edit' do
  #   let(:article) { create(:article) }
  #   before { get :edit, params: { id: article.id }, session: {} }
  
  #   it 'has a 200 status code' do
  #     expect(response).to have_http_status(:ok)
  #   end
  
  #   it 'assigns @article' do
  #     expect(assigns(:article)).to eq article
  #   end
  
  #   it 'renders the :edit template' do
  #     expect(response).to render_template :edit
  #   end
  # end



  # describe 'PATCH #update' do
  #   let!(:article) { create(:article) }
  #   let(:update_attributes) do
  #     {
  #         title: 'update title',
  #         body: 'update body'
  #     }
  #   end
  
  #   it 'saves updated article' do
  #     expect do
  #       patch :update, params: { id: article.id, article: update_attributes }, session: {}
  #     end.to change(Article, :count).by(0)
  #   end
  
  #   it 'updates updated article' do
  #     patch :update, params: { id: article.id, article: update_attributes }, session: {}
  #     article.reload
  #     expect(article.title).to eq update_attributes[:title]
  #     expect(article.body).to eq update_attributes[:body]
  #   end
  
  #   it 'redirects the :create template' do
  #     patch :update, params: { id: article.id, article: update_attributes }, session: {}
  #     article = Article.last
  #     expect(response).to redirect_to(article_path(article))
  #   end
  # end
end