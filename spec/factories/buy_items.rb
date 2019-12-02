FactoryBot.define do
  factory :bought_item, class: User do
    count { 1 }
    send_status { true }
    receive { true }
    user_id {2}
    stationery_id {51}

    pen_tel
    user
  end

  factory :buy_item do
    count { 1 }
    send_status { true }
    receive { false }
    user_id {5}
    stationery_id {51}
  end
end
