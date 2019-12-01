FactoryBot.define do
  factory :stationery do
    id {1}
    name { "sample_pen_tel" }
    price { 100 }
    maker { "sample maker" }
    detail { "sample pen is sample" }

    #factory :stationery_with_stock

    #after(:create) do |stock|
    #  create(:stock, stationery:stationery)
    #end

    #after(:create) do |ranking|
    #  create(:ranking, stationery:stationery)
    #end

    #after(:create) do |category|
    #  create(:stationery_category, stationery:stationery, category: cretae(:category))
    #end

    #after(:create) do |user|
    #  create(:buy_item, stationery:stationery, user: cretae(:login_user))
    #end
  end

  factory :many_make, class: Stationery do
    sequence(:name) { |n| "Mytitle#{n}" }
    price { 100 }
    maker { "sample maker" }
    detail { "sample pen is sample" }
  end
end

