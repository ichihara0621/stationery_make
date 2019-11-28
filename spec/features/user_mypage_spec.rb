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
    user = User.create!(:user,name: "admin",email: "admin@example.org", password: "abcdefg", status:0)

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
      fill_in "Email", with: "admin@example.org"
      fill_in "Password", with: "abcdefg"
      click_button "Log in"

    expect(page).to have_content("Stop receive")

    
  end

 scenario "新規登録後、マイページに遷移し、EditUserが押せるか" do
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

    expect(page).to have_content("Edit user")
    
    click_button "Edit user"

     expect(page).to have_content("Update")


    
  end

end