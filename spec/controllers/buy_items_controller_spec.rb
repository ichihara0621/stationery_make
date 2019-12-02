require 'rails_helper'

RSpec.describe BuyItemsController, type: :controller do

  let(:user) { create(:user) }
  let(:admin) { create(:admin) }

 describe "GET #bought"  do
    before do
      session[:user_id] = user.id
    end
    
    it "userの時、購入品が表示されるか" do
      #@user = FactoryBot.create(:user)
      get :bought
      expect(response).to have_http_status(:success)
    end

    it "userの時、購入品が表示されるか" do
      #@user = FactoryBot.create(:user)
      get :bought
      expect(assigns(:user)).to eq(user)
    end

  end

  describe "GET #bought" do
   before do
      session[:user_id] = admin.id
   end

   it "adminでリクエストがOKになること" do
     get :bought
     expect(response).to have_http_status(:success)
   end

    it "adminでレスポンスが200になること" do
      get :bought
      expect(response).to have_http_status "200"
    end

  end

  describe "GET #index" do
    before do
      session[:user_id] = user.id
    end
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