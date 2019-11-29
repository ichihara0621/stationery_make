FactoryBot.define do
  factory :buy_item do
    count { 1 }
    send_status { true }
    receive { true }
    stationery
    login_user
  end
end
