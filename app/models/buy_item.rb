class BuyItem < ApplicationRecord
  belongs_to :stationery
  belongs_to :cart
end
