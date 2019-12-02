FactoryBot.define do
  factory :stock do
    count { 100 }
    #pen_tel
  end

  factory :stock_album, class:Stock do
    count { 100 }
    stationery
  end
end
