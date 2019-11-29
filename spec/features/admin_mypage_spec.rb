require 'rails_helper'

RSpec.feature "Users", type: :feature do
  scenario "ログイン後マイページに遷移し、キャンセル一覧が表示できるか" do
    admin_login
    click_link "Stop receive"
    expect(page).to have_content("キャンセル")
  end

  scenario "ログイン後マイページに遷移し、文房具追加が表示できるか" do
    admin_login
    click_link "Add Stationery"
    expect(page).to have_content("Create")
  end

  scenario "ログイン後マイページに遷移し、文房具追加が表示できるか" do
    admin_login
    click_link "Add Stationery"

    fill_in "Name", with: "test"
    fill_in "Price", with: "100"
    fill_in "Detail", with: "100"
    fill_in "Maker", with: "test"
    #fill_in "Stock", with: "100"
    #fill_in "Ranking total count", with: "0"
    checked_field "Category", with: "Pen"
    expect(page).to have_content("Create")

    
  end



end