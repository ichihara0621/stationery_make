require 'rails_helper'

RSpec.describe RankingsController, type: :controller do

  describe "GET #index" do

   it "リクエストがOKになること" do
     get :index
     expect(response).to have_http_status(:success)
   end

    it "レスポンスが200になること" do
      get :index
      expect(response).to have_http_status "200"
    end

  end

end
