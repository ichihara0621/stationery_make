User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             address: "tokyo",
             password:              "foobar",
             password_confirmation: "foobar")

50000.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  address = "tokyo"
  password = "password"
  User.create!(name:  name,
               email: email,
               address: address,
               password:              password,
               password_confirmation: password)
end

Stationery.create!(name:  "pentel pen",
                   price: "100",
                   maker: "pentel",
                   detail: "smooth writing pen")


50000.times do |n|
  name  = "stationery#{n+1}"
  price = rand(1..20)*100
  maker = "made in #{rand(10)}"
  detail = "detail of stationery use for #{n+1}"
  Stationery.create!(name:  name,
                     price: price,
                     maker: maker,
                     detail: detail)
end