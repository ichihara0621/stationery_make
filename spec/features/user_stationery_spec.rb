require 'rails_helper'

RSpec.feature "Stationeries", type: :feature do
  scenario "ログインユーザーが文房具詳細を見れるか" do
      stationery = FactoryBot.create(:pen_tel)
      user_login
      click_link "stationery app"
      click_link "sample_pen_tel"
      expect(page).to have_content("sample pen is sample")
  end

  scenario "ログインユーザーが文房具詳細から10個注文できるか" do
      admin_create_stationery
      user_login
      click_link "stationery app"
      click_link "test_alla"
      fill_in "buy_item[count]", with: "10"
      click_button "Order"
      expect(page).to have_content("Buy Create")
      expect(page).to have_content("test_alla")
      expect(page).to have_content("total 1000")
  end

  scenario "ログインユーザーが在庫数より多い文房具を購入できないこと" do
      admin_create_stationery
      user_login
      click_link "stationery app"
      click_link "test_alla"
      fill_in "buy_item[count]", with: "110"
      click_button "Order"
      expect(page).to have_content("在庫数が不足")
  end

  scenario "ログインユーザーが注文した商品を削除できるか" do
      admin_create_stationery
      user_login
      click_link "stationery app"
      click_link "test_alla"
      fill_in "buy_item[count]", with: "10"
      click_button "Order"
      click_link "delete"
      expect(page).to have_content("Stationery deleted")
      expect(page).not_to have_content("test_alla")
  end

  scenario "ログインユーザーが注文した商品を購入確定できるか" do
      admin_create_stationery
      user_login
      click_link "stationery app"
      click_link "test_alla"
      fill_in "buy_item[count]", with: "10"
      click_button "Order"
      expect(
      click_link "購入確定"
      ).to change(Buy_item, :count).to(1)
  end

  scenario "ログインユーザーが購入した商品を購入一覧で見れるか" do
      admin_create_stationery
      user_login
      click_link "stationery app"
      click_link "test_alla"
      fill_in "buy_item[count]", with: "10"
      click_button "Order"
      click_link "購入確定"
      
      visit ('/users/2')
      click_link "Buy Items"
      expect(page).to have_content("test_alla")

  end

  scenario "ログインユーザーが購入した商品をキャンセルできるか" do
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
      expect(page).to have_content("取り消しました")
      expect(page).not_to have_content("test_alla")

  end

  



end