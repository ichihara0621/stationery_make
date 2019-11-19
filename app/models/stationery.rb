class Stationery < ApplicationRecord
    has_many :buy_items
    has_many :stationery_categories
    has_many :categories, through: :stationery_categories
    has_one  :stock
    validates :name, presence: true,
               uniqueness: true
    validates :price, presence: true
    validates :maker, presence: true
    validates :detail, presence: true
    
    sta_cate = Stationery.joins(stationery_categories: :category)
    
    def self.foo
       Stationery.joins(stationery_categories: :category).select("stationeries.*, categories.*")
    end

    def self.search(search)
      if search
        Stationery.where(['name LIKE ?', "%#{search}%"])
      
      else
        Stationery.all
        
      end
    end

    
end
