FactoryBot.define do
  factory :buy_item do
    count { 1 }
    send_status { 1 }
    receive { 1 }
    stationery { nil }
    cart { nil }
  end
end
