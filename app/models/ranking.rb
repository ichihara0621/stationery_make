class Ranking < ApplicationRecord
  belongs_to :stationery
  validates :total_count, numericality:{greater_than: -1}, presence: true
end
