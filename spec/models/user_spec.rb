require 'rails_helper'

RSpec.describe User, type: :model do
  it "メールアドレスが無効(@なし)の場合" do
    user = User.new(
      name: "ichihara misato",
      email: 'ichihara.misatolmi.ne.jp',
      address: "ibaraki",
      password: 'ichiharamisato',
      password_confirmation: 'ichiharamisato'
    )
    expect(user).to be_invalid
  end

  it "メールアドレスが無効(.なし)の場合" do
    user = User.new(
      name: "ichihara misato",
      email: 'ichihara.misato@lminejp',
      address: "ibaraki",
      password: 'ichiharamisato',
      password_confirmation: 'ichiharamisato'
    )
    expect(user).to be_invalid
  end

   it "メールアドレスが空白だと登録できないこと" do
    user = User.new(
      name: "ichihara misato",
      email: '',
      address: "ibaraki",
      password: 'ichiharamisato',
      password_confirmation: 'ichiharamisato'
    )
    expect(user).to be_invalid
  end

   it "メールアドレスが一意であること" do
    user = User.create(
      name: "ichihara misato",
      email: 'ichihara.misato@lminejp',
      address: "ibaraki",
      password: 'ichiharamisato',
      password_confirmation: 'ichiharamisato'
    )
    user = User.new(
      name: "ichihara",
      email: 'ichihara.misato@lminejp',
      address: "ibar",
      password: 'ichihara',
      password_confirmation: 'ichihara'
    )
    
    expect(user).to be_invalid
  end

   it "メールアドレスが小文字と大文字同じなこと（小文字登録後大文字で登録できないこと）" do
    user = User.create(
      name: "ichihara misato",
      email: 'ichihara.misato@lminejp',
      address: "ibaraki",
      password: 'ichiharamisato',
      password_confirmation: 'ichiharamisato'
    )

    user = User.new(
      name: "ichihara",
      email: 'ichihara.MISATO@lminejp',
      address: "ibar",
      password: 'ichihara',
      password_confirmation: 'ichihara'
    )
    expect(user).to be_invalid
  end





  it "メールアドレスが254字の場合" do
    user = User.new(
      name: "ichihara misato",
      email: 'i'*248+'@lm.ne',
      address: "ibaraki",
      password: 'ichiharamisato',
      password_confirmation: 'ichiharamisato'
    )
    expect(user).to be_valid
  end  

  it "メールアドレスが255字の場合" do
    user = User.new(
      name: "ichihara misato",
      email: 'i'*249+'@lm.ne',
      address: "ibaraki",
      password: 'ichiharamisato',
      password_confirmation: 'ichiharamisato'
    )
    expect(user).to be_valid
  end 

  it "メールアドレスが256字の場合" do
    user = User.new(
      name: "ichihara misato",
      email: 'i'*250+'@lm.ne',
      address: "ibaraki",
      password: 'ichiharamisato',
      password_confirmation: 'ichiharamisato'
    )
    expect(user).to be_invalid
  end 


  it "名前が書いていない場合" do
    user = User.new(
      name: "",
      email: 'ichihara.misato@lmi.ne.jp',
      address: "ibaraki",
      password: 'ichiharamisato',
      password_confirmation: 'ichiharamisato'
    )
    expect(user).to be_invalid
  end

  it "名前が49字の場合" do
    user = User.new(
      name: "e"*49,
      email: 'ichihara.misato@lmi.ne.jp',
      address: "ibaraki",
      password: 'ichiharamisato',
      password_confirmation: 'ichiharamisato'
    )
    expect(user).to be_valid
  end

  it "名前が50字の場合" do
    user = User.new(
      name: "i"*50,
      email: 'ichihara.misato@lmi.ne.jp',
      address: "ibaraki",
      password: 'ichiharamisato',
      password_confirmation: 'ichiharamisato'
    )
    expect(user).to be_valid
  end

  it "名前が51字の場合" do
    user = User.new(
      name: "i"*51,
      email: 'ichihara.misato@lmi.ne.jp',
      address: "ibaraki",
      password: 'ichiharamisato',
      password_confirmation: 'ichiharamisato'
    )
    expect(user).to be_invalid
  end

  it "住所が空白の場合" do
    user = User.new(
      name: "i",
      email: 'ichihara.misato@lmi.ne.jp',
      address: "",
      password: 'ichiharamisato',
      password_confirmation: 'ichiharamisato'
    )
    expect(user).to be_invalid
  end

  it "住所が254字の場合" do
    user = User.new(
      name: "i",
      email: 'ichihara.misato@lmi.ne.jp',
      address: "e"*254,
      password: 'ichiharamisato',
      password_confirmation: 'ichiharamisato'
    )
    expect(user).to be_valid
  end

  it "住所が255字の場合" do
    user = User.new(
      name: "i",
      email: 'ichihara.misato@lmi.ne.jp',
      address: "e"*255,
      password: 'ichiharamisato',
      password_confirmation: 'ichiharamisato'
    )
    expect(user).to be_valid
  end

  it "住所が256字の場合" do
    user = User.new(
      name: "i",
      email: 'ichihara.misato@lmi.ne.jp',
      address: "e"*256,
      password: 'ichiharamisato',
      password_confirmation: 'ichiharamisato'
    )
    expect(user).to be_invalid
  end

   it "パスワードが5文字だと登録できないこと" do
    user = User.new(
      name: "i",
      email: 'ichihara.misato@lmi.ne.jp',
      address: "e",
      password: 'ichih',
      password_confirmation: 'ichih'
    )
    expect(user).to be_invalid
  end

  it "パスワードが6文字だと登録できること" do
    user = User.new(
      name: "i",
      email: 'ichihara.misato@lmi.ne.jp',
      address: "e",
      password: 'ichiha',
      password_confirmation: 'ichiha'
    )
    expect(user).to be_valid
  end

  it "パスワードが7文字だと登録できること" do
    user = User.new(
      name: "i",
      email: 'ichihara.misato@lmi.ne.jp',
      address: "e",
      password: 'ichihar',
      password_confirmation: 'ichihar'
    )
    expect(user).to be_valid
  end

  it "パスワード14文字だと登録できること" do
    user = User.new(
      name: "i",
      email: 'ichihara.misato@lmi.ne.jp',
      address: "e",
      password: 'i'*14,
      password_confirmation: 'i'*14
    )
    expect(user).to be_valid
  end

  it "パスワード15文字だと登録できること" do
    user = User.new(
      name: "i",
      email: 'ichihara.misato@lmi.ne.jp',
      address: "e",
      password: 'i'*15,
      password_confirmation: 'i'*15
    )
    expect(user).to be_valid
  end

  it "パスワード16文字だと登録できないこと" do
    user = User.new(
      name: "i",
      email: 'ichihara.misato@lmi.ne.jp',
      address: "e",
      password: 'i'*16,
      password_confirmation: 'i'*16
    )
    expect(user).to be_invalid
  end

  it "password-confirmが空白では登録できないこと" do
    user = User.new(
      name: "i",
      email: 'ichihara.misato@lmi.ne.jp',
      address: "e",
      password: 'i'*13,
      password_confirmation: ''
    )
    expect(user).to be_invalid
  end

  it "password-confirmが一致していれば登録できること" do
    user = User.new(
      name: "i",
      email: 'ichihara.misato@lmi.ne.jp',
      address: "e",
      password: 'i'*13,
      password_confirmation: 'i'*13
    )
    expect(user).to be_valid
  end

  it "password-confirmが一致していなければエラーが出ること" do
    user = User.new(
      name: "i",
      email: 'ichihara.misato@lmi.ne.jp',
      address: "e",
      password: 'i'*13,
      password_confirmation: 'i'*12
    )
    expect(user).to be_invalid
  end
    

end