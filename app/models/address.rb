class Address < ApplicationRecord
  belongs_to :purchase

  # validates :postal_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  # validates :prefecture_id, numecality: { other_than: 0, message: "can't be blank" }
end
