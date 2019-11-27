class Stationery < ApplicationRecord
    has_many :users, through: :buy_items
    has_many :buy_items, dependent: :destroy
    accepts_nested_attributes_for :buy_items
    has_many :stationery_categories, dependent: :destroy
    has_many :categories, through: :stationery_categories
    accepts_nested_attributes_for :stationery_categories, allow_destroy: true
    has_one  :stock, dependent: :destroy
    accepts_nested_attributes_for :stock, allow_destroy: true
    has_one  :ranking, dependent: :destroy
    accepts_nested_attributes_for :ranking, allow_destroy: true
    
    MAX_NAME_LEN = 50
    MAX_PRICE_LEN = 6
    MAX_MAKER_LEN = 50
    MAX_DETAIL_LEN = 250
    validates :name, presence: true, length: { maximum: MAX_NAME_LEN },
               uniqueness: true
    validates :price, presence: true, length: { maximum: MAX_PRICE_LEN }
    validates :maker, presence: true, length: { maximum: MAX_MAKER_LEN }
    validates :detail, presence: true, length: { maximum: MAX_DETAIL_LEN }
    

    def self.search(search)
      if search
        Stationery.where(['name LIKE ?', "%#{search}%"])      
      
      else
        Stationery.all
        
      end
    end

    
end
