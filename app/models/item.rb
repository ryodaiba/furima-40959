class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_day
  has_one_attached :image

  validates :image,           presence: true
  validates :item_name,       presence: true
  validates :description,     presence: true
  validates :category_id,     presence: true, numericality: { other_than: 1, message: 'cant be blank' }
  validates :condition_id,    presence: true, numericality: { other_than: 1, message: 'cant be blank' }
  validates :shipping_fee_id, presence: true, numericality: { other_than: 1, message: 'cant be blank' }
  validates :prefecture_id,   presence: true, numericality: { other_than: 1, message: 'cant be blank' }
  validates :shipping_day_id, presence: true, numericality: { other_than: 1, message: 'cant be blank' }
  validates :price,           presence: true,
                              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
