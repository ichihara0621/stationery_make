module UserHelpers
   def user_login
     user = FactoryBot.create(:user)

      visit login_path
  
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Log in"
       
   end

   def admin_login
     user = FactoryBot.create(:admin)

      visit login_path
  
      fill_in "Email", with: "admin@example.org"
      fill_in "Password", with: "ichihara"
      click_button "Log in"
       
   end

   def admin_logined
     #user = FactoryBot.create(:admin)

      visit login_path
  
      fill_in "Email", with: "admin@example.org"
      fill_in "Password", with: "ichihara"
      click_button "Log in"
       
   end

   def user2_login
     user = FactoryBot.create(:login_user)

      visit login_path
  
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Log in"
       
   end 
   
   def admin_create_stationery
      admin_login
      click_link "Add Stationery"
  
      fill_in "Name", with: "test_alla"
      fill_in "Price", with: "100"
      fill_in "Detail", with: "100"
      fill_in "Maker", with: "test"
      fill_in "stationery[stock_attributes][count]", with: "100"
      fill_in "stationery[ranking_attributes][total_count]", with: "0"
      click_button "Create new stationery"
      visit login_path
      click_link "Log out"
   end

  def user_item_cancel
      admin_create_stationery
      user_login
      click_link "stationery app"
      click_link "test_alla"
      fill_in "buy_item[count]", with: "10"
      click_button "Order"
      click_link "購入確定"
      
      visit ('/users/2')
      click_link "Buy Items"
      click_link "注文取消し"
      visit login_path
      click_link "Log out"
      admin_logined
  end


end
