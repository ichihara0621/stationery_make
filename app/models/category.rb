class Category < ApplicationRecord
    has_many :stationery_categories
    has_many :stationeries, through: :stationery_categories
    #accepts_nested_attributes_for :stationeries #他のモデルを一括で更新＆保存

    validates :category, presence: true
end

