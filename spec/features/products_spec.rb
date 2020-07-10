require 'rails_helper'

RSpec.feature "Products", type: :feature do

  let(:user) {
    FactoryBot.create(:user)
  }

  let(:iphone_12) {
    FactoryBot.create(:product, user_id: user.id)
  }

  let(:iphone_11) {
    FactoryBot.create(:product, model: '11', user_id: user.id)
  }

  before(:each) do
    sign_in user
  end

  describe "View existing products(Index Page)", js: true do

    before do
      iphone_12
      iphone_11
    end

    scenario "should be successful" do
      visit products_path
      expect(page).to have_content(iphone_12.name)
      expect(page).to have_content(iphone_11.name)
    end

  end

  describe "View existing products(Show Page)", js: true do

    before do
      iphone_11
    end

    scenario "should be successful" do
      visit product_path(iphone_11)
      expect(page).to have_content(iphone_11.name)
      expect(page).to have_content(iphone_11.model)
    end

  end

end