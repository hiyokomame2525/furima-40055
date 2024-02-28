class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items

  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は英字と数字の両方が必要です' }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'は全角で入力してください' }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ , message: 'は全角で入力してください' }
  validates :first_pronunciation, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'はカタカナで入力してください' }
  validates :last_pronunciation, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'はカタカナで入力してください' }
  validates :birthday, presence: true
end
