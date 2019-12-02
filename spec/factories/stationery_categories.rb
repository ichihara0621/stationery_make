FactoryBot.define do
  factory :stationery_category do
    id {1}
    category_id {2}
    stationery_id {51}
    #album
    #pen_tel
    
  end
  factory :sta_cate, class:StationeryCategory do
    id {2}
    category_id {2}
    stationery_id {52}
    
    album
    stationery
  end
end
