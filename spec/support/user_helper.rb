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

end
