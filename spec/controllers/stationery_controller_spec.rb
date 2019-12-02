require 'rails_helper'

RSpec.describe StationeryController, type: :controller do
  let(:user) { create(:user) }
  let(:admin) { create(:admin) }
  let(:pen_tel) {create(:pen_tel)}
  let(:stationery) {create(:stationery)}

  describe "GET #new" do
    before do
         session[:user_id] = admin.id
    end
    it "リクエストが0Kになること" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "stationeryに新しい文房具を割り当てること" do
      get :new
      expect(assigns(:stationery)).to be_a_new(Stationery)
    end
  end

  describe "GET #new" do
    it "ログインしてないと302が帰ってくること" do
      get :new
      expect(response).to have_http_status "302"
    end

    it "ログインしてないとSignUpに行くこと" do
      get :new
      expect(response).to redirect_to signup_path
    end

  end

  describe "GET #new" do
    before do
         session[:user_id] = user.id
    end

   it "adminでないと302が帰ってくること" do
      get :new
      expect(response).to have_http_status "302"
    end

    it "adminでないとSignUpに行くこと" do
      get :new
      expect(response).to redirect_to root_path
    end

  end
  
  describe "GET #show" do
    before do
         session[:user_id] = user.id
    end

   it "リクエストがOKになること" do
    get :show, params: { id: stationery.id }
    expect(response).to have_http_status(:success)
    end

    it "@stationeryのページであること" do
      get :show, params: { id: stationery.id }
      expect(assigns(:stationery)).to eq(stationery)
    end

  end

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

  describe "GET #create" do
    before do
         session[:user_id] = admin.id
    end

    it 'データベースに新しい文房具が登録されること' do
        expect{
          post :create, params: {stationery: attributes_for(:stationery)}
        }.to change(Stationery, :count).by(1)
    end

      it 'showにリダイレクトすること' do
        post :create, params: {stationery: attributes_for(:stationery)}
        expect(response).to redirect_to (Stationery.last)
      end

  end

  describe "edit"   do
   before do
      session[:user_id] = admin.id
   end

    it "レスポンスが正常か" do
      get :edit, params: {id: stationery.id}
      expect(response).to have_http_status(:success)
    end

    it "割り当てられた文房具は正しいか" do
      get :edit, params: {id: stationery.id}
      expect(assigns(:stationery)).to eq(stationery)
    end
  end

  describe "GET #edit" do
    it "ログインしてないと302が帰ってくること" do
      get :edit, params: {id: pen_tel.id}
      expect(response).to have_http_status "302"
    end

    it "ログインしてないとSignUpに行くこと" do
      get :edit, params: {id: pen_tel.id}
      expect(response).to redirect_to signup_path
    end

  end

  describe "GET #new" do
    before do
         session[:user_id] = user.id
    end

   it "adminでないと302が帰ってくること" do
      get :edit, params: {id: pen_tel.id}
      expect(response).to have_http_status "302"
    end

    it "adminでないとSignUpに行くこと" do
      get :edit, params: {id: pen_tel.id}
      expect(response).to redirect_to root_path
    end

  end

  describe "destroy"   do
   before do
      session[:user_id] = admin.id
   end

    it "正常に削除できるか" do
      stationery = FactoryBot.create(:stationery)
      expect {
      delete :destroy, params: {id: stationery.id}
      }.to change(Stationery, :count)
    end

  end

  describe "update" do
    before do
      session[:user_id] = admin.id
    end

    

  end


end
