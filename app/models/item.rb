class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user
  belongs_to :preparation_day
  belongs_to :item_condition
  belongs_to :category
  belongs_to :shipping_fee
  belongs_to :prefecture
  #has_one   :order
  has_one_attached :image

  with_options presence:true do
  validates :name
  validates :description
  validates :price 
  validates :image
  end
  with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :prefecture_id
  validates :preparation_day_id
  validates :item_condition_id
  validates :shipping_fee_id
  end
  validates :price, numericality: {greater_than: 299,less_than: 10000000}
  
end
