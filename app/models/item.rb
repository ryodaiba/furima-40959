class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_day
  has_one_attached :image

  validates :image, :item_name, :description, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_day_id, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' }
  validates :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_day_id, numericality: { other_than: 1, message: "can't be blank" }
end