class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])\w{6,12}\z/
         
        with_options presence:true do
         validates :nickname
         validates :email
         with_options format: {with:VALID_PASSWORD_REGEX,
          message: "doesn't input a small character and number with harf size"} do
         validates :password
         validates :password_confirmation
        end
      
      
         with_options format: {with: /\A[ぁ-んァ-ン一-龥々]/} do
         validates :family_name
         validates :first_name
         end
         with_options format: {with: /\A[ァ-ヶー－]+\z/ } do
         validates :family_name_kana
         validates :first_name_kana
         end
         validates :birth_date
        end

         has_many :items
         has_many :orders

        end
