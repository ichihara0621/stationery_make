require 'rails_helper'
require 'users_controller'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "リクエストが0Kになること" do
      get :new
      expect(response).to have_http_status(:success)
    end
    it "@userに新しいユーザーを割り当てること" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end

    it ":newテンプレートを表示すること" do
      get :new
      expect(response).to render_template :new
    end

  end

  describe "GET #show" do
   it "リクエストがOKになること" do
    @user = FactoryBot.create(:user)
    get :show, params: { id: @user.id }
    expect(response).to have_http_status(:success)
    end

    it "@userのページであること" do
      @user = FactoryBot.create(:user)
      get :show, params: { id: @user.id }
      expect(assigns(:user)).to eq @user
    end

  end

  describe "POST #create" do
      it 'リクエストは302 リダイレクトとなること' do
          @user = FactoryBot.create(:login_user)

        post :create, params: {user: attributes_for(:user)}
        expect(response.status).to eq 302
      end
      it 'データベースに新しいユーザーが登録されること' do
            @user = FactoryBot.create(:login_user)

        expect{
          post :create, params: {user: attributes_for(:user)}
        }.to change(User, :count).by(1)
      end
      it 'showにリダイレクトすること' do
            @user = FactoryBot.create(:login_user)

        post :create, params: {user: attributes_for(:user)}
        expect(response).to redirect_to ("/user/1")
      end
  end





  

end

