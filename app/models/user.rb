class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  with_options presence: true do
    validates :password,
              format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: 'is invalid. Include both letters and numbers' }
    validates :nickname
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' }
    validates :last_name_kana, format: { with: /\A[\p{katakana}\u{30fc}]+\z/, message: 'is invalid. Input full-width katakana characters' }
    validates :first_name_kana, format: { with: /\A[\p{katakana}\u{30fc}]+\z/, message: 'is invalid. Input full-width katakana characters' }
    validates :birth_date
  end
end
