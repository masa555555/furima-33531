class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user
  belongs_to :preparation_day
  belongs_to :item_condition
  belongs_to :category
  belongs_to :shipping_fee
  belongs_to :prefecture
  has_one   :order
  has_one_attached :image 
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :price, numericality: {only_integer: true}
  validates :category_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :preparation_day_id, numericality: { other_than: 1 }
  validates :item_condition_id, numericality: { other_than: 1 }
  validates :shipping_fee_id, numericality: { other_than: 1 }
  validates :image, presence: true
  



end
