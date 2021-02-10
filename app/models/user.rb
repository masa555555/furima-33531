class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])\w{6,12}\z/

         validates :nickname, presence: true
         validates :email, presence:  true
         validates :password, presence: true, format: {with:VALID_PASSWORD_REGEX,
        message: "doesn't input a small character and number with harf size"
        }
         validates :password_confirmation, presence: true, length: { minimum: 6}

         with_options format: {with: /\A[ぁ-んァ-ン一-龥]/} do
         validates :family_name, presence:  true
         validates :first_name, presence: true
         end
         with_options format: {with: /\A[ァ-ヶー－]+\z/ } do
         validates :family_name_kana, presence: true
         validates :first_name_kana, presence:  true
         end
         validates :birth_date, presence: true
         

         has_many :items
         has_many :orders
end
