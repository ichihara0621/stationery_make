class Stationery < ApplicationRecord
    validates :name, presence: true,
               uniqueness: true
    validates :price, presence: true
    validates :maker, presence: true
    validates :detail, presence: true
end
