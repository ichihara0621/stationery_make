require 'rails_helper'

RSpec.describe User, type: :model do
  it "文房具が追加される場合" do
    stationery = Stationery.new(
      name: "sample",
      price: '100',
      maker: "ibaraki",
      detail: 'sample',
    )
    expect(stationery).to be_valid
  end

  it "名前が未記入の場合" do
    stationery = Stationery.new(
      name: "",
      price: '100',
      maker: "ibaraki",
      detail: 'sample',
    )
    expect(stationery).to be_invalid
  end

  it "名前が49字の場合" do
    stationery = Stationery.new(
      name: "s"*49,
      price: '100',
      maker: "ibaraki",
      detail: 'sample',
    )
    expect(stationery).to be_valid
  end

   it "名前が50字の場合" do
    stationery = Stationery.new(
      name: "s"*50,
      price: '100',
      maker: "ibaraki",
      detail: 'sample',
    )
    expect(stationery).to be_valid
  end

   it "名前が51字の場合" do
    stationery = Stationery.new(
      name: "s"*51,
      price: '100',
      maker: "ibaraki",
      detail: 'sample',
    )
    expect(stationery).to be_invalid
  end

  it "メーカーが未記入の場合" do
    stationery = Stationery.new(
      name: "iiii",
      price: '100',
      maker: "",
      detail: 'sample',
    )
    expect(stationery).to be_invalid
  end
  
  it "メーカーが49字の場合" do
    stationery = Stationery.new(
      name: "simple",
      price: '100',
      maker: "i"*49,
      detail: 'sample',
    )
    expect(stationery).to be_valid
  end

  it "メーカーが50字の場合" do
    stationery = Stationery.new(
      name: "simple",
      price: '100',
      maker: "i"*50,
      detail: 'sample',
    )
    expect(stationery).to be_valid
  end

  it "メーカーが51字の場合" do
    stationery = Stationery.new(
      name: "simple",
      price: '100',
      maker: "i"*51,
      detail: 'sample',
    )
    expect(stationery).to be_invalid
  end

  it "詳細が未記入の場合" do
    stationery = Stationery.new(
      name: "simple",
      price: '100',
      maker: "i",
      detail: '',
    )
    expect(stationery).to be_invalid
  end

  it "詳細が249字の場合" do
    stationery = Stationery.new(
      name: "simple",
      price: '100',
      maker: "i",
      detail: 'i'*249,
    )
    expect(stationery).to be_valid
  end

  it "詳細が250字の場合" do
    stationery = Stationery.new(
      name: "simple",
      price: '100',
      maker: "i",
      detail: 'i'*250,
    )
    expect(stationery).to be_valid
  end

  it "詳細が251字の場合" do
    stationery = Stationery.new(
      name: "simple",
      price: '100',
      maker: "i",
      detail: 'i'*251,
    )
    expect(stationery).to be_invalid
  end

  it "値段が未記入の場合" do
    stationery = Stationery.new(
      name: "simple",
      price: '',
      maker: "i",
      detail: 'i',
    )
    expect(stationery).to be_invalid
  end
   
  it "値段が5字の場合" do
    stationery = Stationery.new(
      name: "simple",
      price: 10000,
      maker: "i",
      detail: 'i',
    )
    expect(stationery).to be_valid
  end

  it "値段が6字の場合" do
    stationery = Stationery.new(
      name: "simple",
      price: 100000,
      maker: "i",
      detail: 'i',
    )
    expect(stationery).to be_valid
  end

  it "値段が7字の場合" do
    stationery = Stationery.new(
      name: "simple",
      price: 1000000,
      maker: "i",
      detail: 'i',
    )
    expect(stationery).to be_invalid
  end

end