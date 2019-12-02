require 'rails_helper'

RSpec.feature "Stationeries", type: :feature do
   describe "many_make" do
      before do
         FactoryBot.create_list(:many_make, 50)
         category = FactoryBot.create(:category)
      end
      
      #scenario "30個の文房具が写り、31個目はない" do
      #   visit stationery_index_path
      #   expect(page).to have_content("Mytitle12")
      #   expect(page).to have_content("Mytitle41")
      #   expect(page).not_to have_content("Mytitle42")
      #end
   
      scenario "曖昧検索ができること" do
         visit stationery_index_path
   
         fill_in "search", with: "Mytitle5" 
         click_button "Search"
   
         expect(page).to have_content("Mytitle5", count: 9)
         expect(page).to have_css('li.name', count: 9)
         expect(page).to have_content("Mytitle52")
         expect(page).not_to have_content("Mytitle63")
      end 
   end

   describe "1つだけ" do
      scenario "カテゴリ検索ができること" do
        stationery51 = FactoryBot.create(:pen_tel)
        category2 = FactoryBot.create(:album)
        stationery_category = FactoryBot.create(:stationery_category, stationery: stationery51, category: category2)
        visit stationery_index_path
        select "Album", from: "category_id", match: :first
        click_link "sample_pen_tel"
        expect(page).to have_content("Album")
      end
   end 

   

end