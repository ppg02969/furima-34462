class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
         VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
         validates :password, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX, message: 'Include both letters and numbers'}
         validates :nickname, presence: true
         validates :last_name, presence: true, format:{with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/,message: 'Full-width characters'}
         validates :first_name, presence: true, format:{with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/,message: 'Full-width characters'}
         validates :last_name_kana, presence: true, format:{with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters'}
         validates :first_name_kana, presence: true, format:{with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters'}
         validates :birthday, presence: true
end
