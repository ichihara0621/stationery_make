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

  scenario "ログイン後マイページに遷移し、文房具が追加できるか" do
    FactoryBot.create(:category)

    admin_login
    click_link "Add Stationery"

    fill_in "Name", with: "test"
    fill_in "Price", with: "100"
    fill_in "Detail", with: "100"
    fill_in "Maker", with: "test"
    fill_in "stationery[stock_attributes][count]", with: "100"
    fill_in "stationery[ranking_attributes][total_count]", with: "0"
    check "Pen"
    click_button "Create new stationery"
    expect(page).to have_content("Stationery Create")
  end
  
  scenario "ログイン後マイページに遷移し、追加した文房具が表示できるか" do
    stationery = FactoryBot.create(:stationery)
    admin_login
    click_link "Add Stationery"
    click_link "stationery app"
    visit ('/stationery/52')
    expect(page).to have_content("sample_album")
  end

  scenario "追加したログイン後マイページに遷移し、文房具を削除できるか" do
    stationery = FactoryBot.create(:stationery)
    admin_login
    click_link "Add Stationery"
    click_link "stationery app"
    visit ('/stationery/52')
    click_link "delete"
    expect(page).to have_content("deleted")
    expect(page).not_to have_content("sample_pen_tel")
    
  end 
  
  scenario "追加した文房具を編集する画面が表示できるか" do
    stationery = FactoryBot.create(:stationery)
    admin_login
    click_link "Add Stationery"
    click_link "stationery app"
    visit ('/stationery/52')
    click_link "edit"
    expect(page).to have_content("Update")
  end 

  scenario "追加した文房具を編集する画面が表示できるか" do
    stationery = FactoryBot.create(:stationery)
    admin_login
    click_link "Add Stationery"
    click_link "stationery app"
    visit ('/stationery/52')
    click_link "edit"

    fill_in "Name", with: "pentel_sample"
    click_button "Update"

    expect(page).to have_content("Stationery Updated")
    expect(page).to have_content("pentel_sample")
    
  end
 
  scenario "adminがユーザーキャンセル一覧を表示できるか" do
    admin_login
    click_link "Stop receive"
    expect(page).to have_content("キャンセル一覧")

  end

  scenario "adminがユーザーキャンセル商品を発送中止できるか" do
    stationery = FactoryBot.create(:pen_tel)
    user = FactoryBot.create(:login_user)
    buy_item = FactoryBot.create(:buy_item, user: user, stationery: stationery)
    stock = FactoryBot.create(:stock, stationery:stationery)
    
    admin_login
    click_link "Stop receive"
    click_link "配送中止"
    expect(page).to have_content("配送を中止します")

  end

end