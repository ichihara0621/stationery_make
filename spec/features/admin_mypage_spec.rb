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
    #expect(page).to have_field('Pen')
  end

  #scenario "ログイン後マイページに遷移し、Penが表示できるか" do
  #  admin_login
  #  click_link "Add Stationery"
  #  expect(page).to have_content("stationery[category_ids][]")
  #end

  scenario "ログイン後マイページに遷移し、文房具が追加できるか" do
    admin_login
    click_link "Add Stationery"

    fill_in "Name", with: "test"
    fill_in "Price", with: "100"
    fill_in "Detail", with: "100"
    fill_in "Maker", with: "test"
    fill_in "stationery[stock_attributes][count]", with: "100"
    fill_in "stationery[ranking_attributes][total_count]", with: "0"
    #check "stationery[category_ids][1]"
    click_button "Create new stationery"
    expect(page).to have_content("Stationery Create")

    
  end
  
  scenario "ログイン後マイページに遷移し、追加した文房具が表示できるか" do
    stationery = FactoryBot.create(:stationery)
    admin_login
    click_link "Add Stationery"
    click_link "stationery app"
    visit ('/stationery/1')
    expect(page).to have_content("sample_pen_tel")
  end

  scenario "追加したログイン後マイページに遷移し、文房具を削除できるか" do
    stationery = FactoryBot.create(:stationery)
    admin_login
    click_link "Add Stationery"
    click_link "stationery app"
    visit ('/stationery/1')
    click_link "delete"
    expect(page).to have_content("deleted")
    expect(page).not_to have_content("sample_pen_tel")
    
  end 
  
  scenario "追加した文房具を編集する画面が表示できるか" do
    stationery = FactoryBot.create(:stationery)
    admin_login
    click_link "Add Stationery"
    click_link "stationery app"
    visit ('/stationery/1')
    click_link "edit"
    expect(page).to have_content("Update")
  end 

  scenario "追加した文房具を編集する画面が表示できるか" do
    stationery = FactoryBot.create(:stationery)
    admin_login
    click_link "Add Stationery"
    click_link "stationery app"
    visit ('/stationery/1')
    click_link "edit"

    fill_in "Name", with: "pentel_sample"
    click_button "Update"

    expect(page).to have_content("Stationery Updated")
    expect(page).to have_content("pentel_sample")
    
  end
 
  scenario "adminがユーザーキャンセル一覧を表示できるか" do
    user_item_cancel
    click_link "Stop receive"
    expect(page).to have_content("キャンセル一覧")

  end

  





end