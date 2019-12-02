FactoryBot.define do
  factory :pen_tel, class: Stationery do
    id {51}
    name { "sample_pen_tel" }
    price { 100 }
    maker { "sample maker" }
    detail { "sample pen is sample" }
  end

  factory :many_make, class: Stationery do
    
    sequence(:name) { |n| "Mytitle#{n}" }
    price { 100 }
    maker { "sample maker" }
    detail { "sample pen is sample" }
  end

  factory :stationery do
    id {52}
    name { "sample_album" }
    price { 100 }
    maker { "sample maker" }
    detail { "sample pen is sample" }
  end
end

