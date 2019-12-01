require 'rails_helper'

RSpec.feature "Stationeries", type: :feature do
   before do
      FactoryBot.create_list(:many_make, 50)
   end
   
   scenario "30個の文房具が写り、31個目はない" do
      visit stationery_index_path
      expect(page).to have_content("Mytitle1")
      expect(page).to have_content("Mytitle30")
      expect(page).not_to have_content("Mytitle31")
   end

   scenario "曖昧検索ができること" do
      visit stationery_index_path

      fill_in "search", with: "Mytitle5" 
      click_button "Search"

      expect(page).to have_content("Mytitle5", count: 9)
      expect(page).to have_css('li.name', count: 9)
      expect(page).to have_content("Mytitle52")
      expect(page).not_to have_content("Mytitle63")
   end 
   
   scenario "カテゴリ検索ができること" do
      visit stationery_index_path
      select value = 1, from: "category_id"

   end 

   

end