#User.create!(name:  "Example User",
#             email: "example@railstutorial.org",
#             address: "tokyo",
#             password:              "foobar",
#             password_confirmation: "foobar",
#             status: 0)
#
#100.times do |n|
#  name  = "user#{n+1}"
#  email = "example-#{n+1}@railstutorial.org"
#  address = "tokyo"
#  password = "password"
#  status = 1
#  User.create!(name:  name,
#               email: email,
#               address: address,
#               password:              password,
#               password_confirmation: password,
#               status: status)
#end

#Stationery.create!(name:  "pentel pen",
#                   price: "100",
#                   maker: "pentel",
#                   detail: "smooth writing pen")
#
#
#1000.times do |n|
#  name  = "stationery#{n+1}"
#  price = rand(1..20)*100
#  maker = "made in #{rand(10)}"
#  detail = "detail of stationery use for #{n+1}"
#
#  Stationery.create!(name:  name,
#                     price: price,
#                     maker: maker,
#                     detail: detail)
#end

#cart
#100.times do |n|
#  total_price = rand(1..100)*100
#  user_id = rand(1..100)
#  
#
#  Cart.create!(total_price: total_price,
#               user_id: user_id)
#end
#
##buy_item
#1000.times do |n|
#  count = rand(1..100)*100
#  send_status = true
#  receive = true
#  stationery_id = rand(1..1000)
#  cart_id = rand(1..100)
#  user_id = rand(1..100)
#
#  BuyItem.create!(count: count,
#                   send_status: send_status,
#                   receive: receive,
#                   stationery_id: stationery_id,
#                   cart_id: cart_id,
#                   user_id: user_id)
#end

#category

  

#Category.create!([{name:  "Pen"},
#                  {name:  "File"},
#                  {name:  "Pencase"},
#                  {name:  "Notebook"},
#                  {name:  "Album"},
#                  {name:  "Diary"},
#                  {name:  "Eraser"}])
#
#
##ranking
#10.times do |n|
# stationery_id = rand(1..10)
# total_count = rand(100..200)
#
# Ranking.create!(stationery_id: stationery_id,
#                 total_count: total_count)
#end

#stocks
#Stock.create!(count: 500,
#              stationery_id: 1)

#1001.times do |n|
#for n in (2..1001)
#  count = rand(50..1000)
#  #stationery_id = n
#
# Stock.create!(count: count,
#              stationery_id: n)
#end


#stationery_category
#StationeryCategory.create!(stationery_id: 1,
 #                          category_id: 7015)

#1001.times do |n|
category_id = rand(7015..7021)
for n in (3..1001)
  #stationery_id = n
  

 StationeryCategory.create!(stationery_id: n,
                            category_id: category_id)
end



