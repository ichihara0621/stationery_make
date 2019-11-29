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
      
      it 'データベースに新しいユーザーが登録されること' do
            #@user = FactoryBot.create(:into_user)

        expect{
          post :create, params: {user: attributes_for(:user)}
        }.to change(User, :count).by(1)
      end

      it 'showにリダイレクトすること' do
            #@user = FactoryBot.create(:into_user)

        post :create, params: {user: attributes_for(:user)}
        
        expect(response).to redirect_to "http://test.host/users/2"
      end
  end

  describe "edit"   do
    it "レスポンスが正常か" do
      @user = FactoryBot.create(:user)
      get :edit, params: {id: @user.id}
      expect(response).to have_http_status(:success)
    end

  end
  
  describe "#update" do
     it "正常にユーザーを更新できるか" do
      @user = FactoryBot.create(:user)
      user_params = {name: @user}
      patch :update, params: {id:@user.id, name: "aaaa", email:@user.email, 
                              address:@user.address, password: @user.password, password_confirmation: @user.password}
      expect(@user.reload.name).to eq "aaa"
     end


  end

  describe "POST #leave"  do
    let!(:user) { create(:user) }
    let(:update_attributes) do
    {status: 2}
    end

     it "正常にstatusがアップデートされるか" do
      @user = FactoryBot.create(:user)
       patch :update, params: {id: @user.id, name: @user.name, 
                               email: @user.email, address: @user.address, password: @user.password}
       user.reload
       expect(@user.status).to eq update_attributes[:status]
    end
  end

  describe "POST #cancel"  do
    it "正常にreceiveがアップデートされるか" do
    
    
    end

  end

  describe "POST #stop"  do
    it "正常にsend_statusがアップデートされるか" do
    
    
    end

  end

  describe "GET #bought"  do
    it "userの時、購入品が表示されるか" do
    
    
    end

  end

  describe "GET #bought"  do
    it "adminの時、キャンセルが表示されるか" do
    
    
    end

  end




  

end

