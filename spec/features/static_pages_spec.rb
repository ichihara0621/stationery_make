require 'rails_helper'

describe 'home' do
  specify 'rootへ飛ぶか' do
    visit root_path
    expect(current_path).to eq root_path
  end
end
