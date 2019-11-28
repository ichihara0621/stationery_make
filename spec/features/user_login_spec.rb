require 'rails_helper'

RSpec.feature "Users", type: :feature do
    
  scenario "Signupページにページ遷移できるか" do
    visit root_path
    click_on "Sign up"

    expect(page).to have_content("Sign up")
  end

  scenario "ユーザー登録できること" do
    user = FactoryBot.build(:user)

    visit new_user_path

    expect {
    fill_in "Name", with: user.name
    fill_in "Email", with: user.email
    fill_in "Address", with: user.address
    fill_in "Password", with: user.password
    fill_in "Confirmation", with: user.password_confirmation
    click_button "Create my account"
    }.to change(User, :count).to(1)
  end

  scenario "エラーメッセージが正しく表示されること" do
    visit new_user_path

    fill_in "Name", with: ""
    fill_in "Email", with: ""
    fill_in "Address", with: ""
    fill_in "Password", with: ""
    fill_in "Confirmation", with: ""
    click_button "Create my account"

    expect(page).to have_content("can't be blank")

  end

  scenario "正しいemailとパスワードでログイン成功" do
    
    user = FactoryBot.create(:user)
    
    visit login_path
     
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Log in"
  
      expect(page).to have_content("退会")
  
  end

 #ユーザー名とパスワードが違う
  scenario "パスワードが違う場合に無効エラーが出るか" do
    user = FactoryBot.create(:user)

    visit login_path
     
      fill_in "Email", with: "test@example.org"
      fill_in "Password", with: "abcdefhhh"
      click_button "Log in"
  
      expect(page).to have_content("Invalid email/password combination")
  
  end
 #ユーザーがいない
 scenario "登録されていないメールアドレスでログインできない" do
    

    visit login_path
  
      fill_in "Email", with: "ichihara@lmi.ne.jp "
      fill_in "Password", with: "aiueoooooooo"
      click_button "Log in"
  
      expect(page).to have_content("Invalid email/password combination")
  
  end

  scenario "adminユーザーがログインした時、アドミンホームに遷移できること" do
    user = FactoryBot.create(:admin)

    visit login_path
  
      fill_in "Email", with: "admin@example.org"
      fill_in "Password", with: "ichihara"
      click_button "Log in"
  
      expect(page).to have_content("Stop receive")
  
  end


end