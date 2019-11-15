class Stationery < ApplicationRecord
    has_many :buy_item
    has_many :stationery_category
    validates :name, presence: true,
               uniqueness: true
    validates :price, presence: true
    validates :maker, presence: true
    validates :detail, presence: true

    def self.search(search)
      if search
        Stationery.where(['name LIKE ?', "%#{search}%"])
      else
        Stationery.all
      end
    end
end
