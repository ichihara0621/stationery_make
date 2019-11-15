class Ranking < ApplicationRecord
  belongs_to :stationery
  has_many :stationery
end
