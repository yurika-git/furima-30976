class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true, length: { minimum: 6 }       # 「６文字以上」
  validates :surname, presence: true
  validates :name, presence: true
  validates :surname_kana, presence: true
  validates :name_kana, presence: true
  validates :birthday, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :encrypted_password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
    validates :surname
    validates :name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: '全角カタカナを使用してください' } do
    validates :surname_kana
    validates :name_kana
  end

end
