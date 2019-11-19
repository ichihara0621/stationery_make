class Ranking < ApplicationRecord
  belongs_to :stationery
  has_many :stationeries
end
