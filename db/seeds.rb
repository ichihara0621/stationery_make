#User.create!(name:  "Example User",
#             email: "example@railstutorial.org",
#             address: "tokyo",
#             password:              "foobar",
#             password_confirmation: "foobar")
#
#50000.times do |n|
#  name  = "user#{n+1}"
#  email = "example-#{n+1}@railstutorial.org"
#  address = "tokyo"
#  password = "password"
#  User.create!(name:  name,
#               email: email,
#               address: address,
#               password:              password,
#               password_confirmation: password)
#end
#
#Stationery.create!(name:  "pentel pen",
#                   price: "100",
#                   maker: "pentel",
#                   detail: "smooth writing pen")
#
#
#50000.times do |n|
#  name  = "stationery#{n+1}"
#  price = rand(1..20)*100
#  maker = "made in #{rand(10)}"
#  detail = "detail of stationery use for #{n+1}"
#  Stationery.create!(name:  name,
#                     price: price,
#                     maker: maker,
#                     detail: detail)
#end

#cart
#10000.times do |n|
#  total_price = rand(1..100)*100
#  user_id = rand(1..40000)
#
#  Cart.create!(total_price: total_price,
#               user_id: user_id)
#end

#buy_item
10000.times do |n|
  count = rand(1..100)*100
  send_status = rand(0..2)
  receive = 0
  stationery_id = rand(1..10000)
  cart_id = rand(1..500)

  BuyItem.create!(count: count,
                   send_status: send_status,
                   receive: receive,
                   stationery_id: stationery_id,
                   cart_id: cart_id)
end

