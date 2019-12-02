FactoryBot.define do
  factory :category do
    id {1}
    name { "Pen" }
  end

  factory :album, class: Category do
    id {2}
    name { "Album" }
  end
end
