class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :name, presence: true, length: { maximum: 40 }
  validates :category_id, :status_id, :burden_id, :area_id, :days_to_ship_id, :saler_id,presence: true
  validates :text, presence: true, length: { maximum: 1000 }
  validates :selling_price, presence: true, numericality: { greater_than: 299, less_than:10000000 }
  has_one :buyer
  belongs_to :category
  belongs_to :user, optional: true
  belongs_to :saler, class_name: "User", optional: true
  belongs_to :buyer, class_name: "User", optional: true
  belongs_to_active_hash :area
  belongs_to_active_hash :burden
  belongs_to_active_hash :days_to_ship
  belongs_to_active_hash :status

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  scope :search, -> (search){ where('text LIKE(?)', "%#{search}%") }

end
