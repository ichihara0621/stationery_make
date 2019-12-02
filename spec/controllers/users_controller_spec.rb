require 'rails_helper'
require 'users_controller'

RSpec.describe UsersController, type: :controller do

  let(:user) { create(:user) }
  let(:login_user) { create(:login_user) }

  let(:admin) { create(:admin) }
  let(:pen_tel) {create(:pen_tel)}


  describe "GET #new" do
    it "リクエストが0Kになること" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "@userに新しいユーザーを割り当てること" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end

  end

  describe "GET #show" do
   before do
      session[:user_id] = user.id
   end

   it "リクエストがOKになること" do
    #@user = FactoryBot.create(:user)
    #sign_in @user
    get :show, params: { id: user.id }
    expect(response).to have_http_status(:success)
    end

    it "@userのページであること" do
      #@user = FactoryBot.create(:user)
      #sign_in @user
      get :show, params: { id: user.id }
      expect(assigns(:user)).to eq user
    end
  end

  describe "GET #show" do
    it "ログインしてないと302が帰ってくること" do
      get :show, params: { id: login_user.id}
      expect(response).to have_http_status "302"
    end

    it "ログインしてないとSignUpに行くこと" do
      get :show, params: { id: login_user.id}
      expect(response).to redirect_to login_path
    end

  end

  describe "POST #create" do
      
      it 'データベースに新しいユーザーが登録されること' do
        expect{
          post :create, params: {user: attributes_for(:user)}
        }.to change(User, :count).by(1)
      end

      it 'showにリダイレクトすること' do
        post :create, params: {user: attributes_for(:user)}
        expect(response).to redirect_to (User.last)
      end
  end

  describe "edit"   do
   before do
      session[:user_id] = user.id
   end

    it "レスポンスが正常か" do
      get :edit, params: {id: user.id}
      expect(response).to have_http_status(:success)
    end

    it "割り当てられたユーザーは正しいか" do
      get :edit, params: {id: user.id}
      expect(assigns(:user)).to eq(user)
    end


  end

  describe "GET #edit" do
    it "ログインしてないと302が帰ってくること" do
      get :edit, params: { id: login_user.id}
      expect(response).to have_http_status "302"
    end

    it "ログインしてないとSignUpに行くこと" do
      get :edit, params: { id: login_user.id}
      expect(response).to redirect_to login_path
    end

  end
  
  describe "#update" do
    #let!(:user){create(:user)}
    let(:update_attributes) do
     {name: "New name"}
    end

    before do
      session[:user_id] = user.id
    end

    it "更新できているか" do
      patch :update, params: {user: attributes_for(:user)}
      user.reload
      expect(user.name).to eq update_attributes[:name]
    end
  end

  describe "PATCH #update" do
    it "ログインしてないと302が帰ってくること" do
      patch :update, params: { id: login_user.id}
      expect(response).to have_http_status "302"
    end

    it "ログインしてないとSignUpに行くこと" do
      patch :update, params: { id: login_user.id}
      expect(response).to redirect_to login_path
    end

  end

  describe "POST #leave"  do
    let!(:user) { create(:user) }
    let(:update_attributes) do
     {status: 2}
    end

    before do
      session[:user_id] = user.id
    end

    it "正常にstatusがアップデートされるか" do
       post :leave, params: {user: attributes_for(:user)}
       user.reload
       expect(user.status).to eq update_attributes[:status]
    end
  end

  describe "POST #leave" do
    it "ログインしてないと302が帰ってくること" do
      post :leave, params: { id: login_user.id}
      expect(response).to have_http_status "302"
    end

    it "ログインしてないとSignUpに行くこと" do
      post :leave, params: { id: login_user.id}
      expect(response).to redirect_to login_path
    end

  end

  describe "POST #cancel"  do
    let(:user) { create(:user) }
    let(:pen_tel) {create(:pen_tel)}
    let(:bought_item) {create(:bought_item)}
    let(:update_attributes) do
     {receive: false}
    end

    before do
      session[:user_id] = user.id
    end

    it "正常にreceiveがアップデートされるか" do
      post :cancel, params: {bought_item: attributes_for(:bought_item)}
      bought_item.reload
      expect(bought_item.receive).to eq update_attributes[:receive]
    end

  end

  describe "POST #cancel" do
    it "ログインしてないと302が帰ってくること" do
      post :cancel, params: { id: login_user.id}
      expect(response).to have_http_status "302"
    end

    it "ログインしてないとSignUpに行くこと" do
      post :cancel, params: { id: login_user.id}
      expect(response).to redirect_to login_path
    end

  end

  describe "POST #stop"  do
    before do
      session[:user_id] = admin.id
    end

    it "正常にsend_statusがアップデートされるか" do
      post :stop, params: {bought_item: attributes_for(:bought_item)}
      bought_item.reload
      expect(bought_item.receive).to eq update_attributes[:receive]
    end

  end

  describe "POST #stop" do
    it "ログインしてないと302が帰ってくること" do
      post :stop, params: { id: login_user.id}
      expect(response).to have_http_status "302"
    end

    it "ログインしてないとSignUpに行くこと" do
      post :stop, params: { id: login_user.id}
      expect(response).to redirect_to login_path
    end

  end

  
end

