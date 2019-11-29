FactoryBot.define do
  factory :user do
    id {2}
    name { "test" }
    email { "test@example.org" }
    address { "suginami" }
    password { "ichihara" }
    password_confirmation { "ichihara" }
    status {1}
    
  end

  factory :admin, class: User do
    id {1}
    name { "admin" }
    email { "admin@example.org" }
    address { "suginami" }
    password { "ichihara" }
    password_confirmation { "ichihara" }
    status {0}
  end

  factory :login_user, class: User do
    id {1}
    name { "aiue" }
    email { "aiue@example.org" }
    address { "suginami" }
    password { "ichihara" }
    password_confirmation { "ichihara" }
    status {1}

    after(:create) do |login_user|
      create(:buy_item, login_user: login_user)
    end
    
  end

  factory :into_user, class: User do
  
    name { "akakaka" }
    email { "aiue@example.org" }
    address { "suginami" }
    password { "ichihara" }
    password_confirmation { "ichihara" }
    
  end


end
