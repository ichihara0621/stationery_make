require 'rails_helper'

RSpec.feature "Users", type: :feature do
  scenario "新規登録後、マイページに遷移できるか" do
    user = FactoryBot.build(:user,name: "test",email: "test@example.org", password: "abcdefg", password_confirmation: "abcdefg")

    visit new_user_path

    expect {
    fill_in "Name", with: user.name
    fill_in "Email", with: user.email
    fill_in "Address", with: user.address
    fill_in "Password", with: user.password
    fill_in "Confirmation", with: user.password_confirmation
    click_button "Create my account"
    }.to change(User, :count).to(1)

    expect(page).to have_content("test")

    
  end

  scenario "ログイン登録後、マイページに遷移できるか" do
    user = FactoryBot.build(:user,name: "test",email: "test@example.org", password: "abcdefg", password_confirmation: "abcdefg")

    visit new_user_path

    expect {
    fill_in "Name", with: user.name
    fill_in "Email", with: user.email
    fill_in "Address", with: user.address
    fill_in "Password", with: user.password
    fill_in "Confirmation", with: user.password_confirmation
    click_button "Create my account"
    }.to change(User, :count).to(1)

    visit login_path
     user = User.last
      fill_in "Email", with: "test@example.org"
      fill_in "Password", with: "abcdefg"
      click_button "Log in"

    expect(page).to have_content("退会する")

    
  end

  scenario "アドミンユーザーで、ログイン登録後、マイページに遷移できるか" do
    admin_login
    expect(page).to have_content("Stop receive") 
  end

 scenario "ログイン後マイページに遷移し、EditUserが押せるか" do
    user_login
    expect(page).to have_content("Edit user")
    click_link "Edit user"
    expect(page).to have_content("Update")
  end

  scenario "ログイン後マイページに遷移し、BuyItemが押せるか" do
    user_login
    click_link "Buy Items"
    expect(page).to have_content("test")
  end

  scenario "ログイン後マイページに遷移し、退会できるか" do
    user_login
    click_link "退会する"
    expect(page).to have_content("またのご利用")
  end

  scenario "ログイン後マイページに遷移し、ランキングが表示できるか" do
    user_login
    click_link "Ranking"
    expect(page).to have_content("ランキング")
  end

  scenario "ログイン後マイページに遷移し、AllStationeryが表示できるか" do
    user_login
    click_link "stationery app"
    expect(page).to have_content("All")
  end

  scenario "ログインユーザーが登録情報を" do
    user_login
    click_link "stationery app"
    expect(page).to have_content("All")
  end



end