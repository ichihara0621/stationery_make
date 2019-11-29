class Stock < ApplicationRecord
  belongs_to :stationery
  validates :count, numericality:{greater_than: -1}, presence: true
end
