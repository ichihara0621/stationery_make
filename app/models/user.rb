class User < ApplicationRecord
  has_many :stationeries, through: :buy_items
  has_many :buy_items, dependent: :destroy # source: :buy_items
  accepts_nested_attributes_for :buy_items

  MAX_NAME_LEN = 50
  MAX_EMAIL_LEN = 255
  MAX_PASS_LEN = 15
  MIN_PASS_LEN = 6
  MAX_ADDRESS_LEN = 255
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: MAX_NAME_LEN }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: MAX_EMAIL_LEN },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: MIN_PASS_LEN, maximum: MAX_PASS_LEN }
  validates :address, presence: true, length: { maximum: MAX_ADDRESS_LEN }
  
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end