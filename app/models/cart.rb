class Cart < ApplicationRecord
  belongs_to :user
  has_many :buy_items
end
