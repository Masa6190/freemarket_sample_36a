class Address < ApplicationRecord
  belongs_to :user
  validates :familyname, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力して下さい'}
  validates :firstname, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力して下さい'}
  validates :familyname_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力して下さい'}
  validates :firstname_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力して下さい'}
  validates :birth_year, presence: true  
  validates :birth_month, presence: true
  validates :birth_day, presence: true
  validates :familyname_deliver, presence: true
  validates :firstname_deliver, presence: true
  validates :familyname_deliver_kana, presence: true
  validates :firstname_deliver_kana, presence: true
  validates :postal_code, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :block, presence: true
end
