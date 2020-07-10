require 'rails_helper'

RSpec.feature "Products Filters", type: :feature do

  let(:user) {
    FactoryBot.create(:user)
  }

  let(:iphone_xs) {
    FactoryBot.create(:product, name: 'Inphone XS', model: 'xs1233', user_id: user.id)
  }

  let(:oneplus) {
    FactoryBot.create(:product, name: 'Oneplus 8', model: '81212asds', brand: 'Oneplus', user_id: user.id)
  }

  before(:each) do
    sign_in user
    iphone_xs
    oneplus
    visit products_path
  end

  describe "Filter Product with name", js: true do

    scenario "should succesfully filter with name constraint" do

      within('form') do
        fill_in 'q_name_cont', with: iphone_xs.name
      end

      click_button 'Filter'

      expect(page).to have_content(iphone_xs.name)
      expect(page).to_not have_content(oneplus.name)

    end

  end

  describe "Filter Product with model", js: true do

    scenario "should succesfully filter with model constraint" do

      within('form') do
        fill_in 'q_model_cont', with: iphone_xs.model
      end

      click_button 'Filter'

      expect(page).to have_content(iphone_xs.model)
      expect(page).to_not have_content(oneplus.model)

    end

  end

  describe "Filter Product with brand", js: true do

    scenario "should succesfully filter with brand constraint" do

      within('form') do
        fill_in 'q_brand_cont', with: iphone_xs.brand
      end

      click_button 'Filter'

      expect(page).to have_content(iphone_xs.brand)
      expect(page).to_not have_content(oneplus.brand)

    end

  end

  describe "Filter Product with RAM", js: true do

    scenario "should succesfully filter with RAM with 10 GB constraint" do

      within('form') do
        check 'q_ram_lteq', with: 10
      end

      click_button 'Filter'

      expect(page).to_not have_content(iphone_xs.name)
      expect(page).to_not have_content(oneplus.name)

    end

    scenario "should succesfully filter with RAM with 32 GB constraint" do

      within('form') do
        check 'q_ram_lteq', with: 32
      end

      click_button 'Filter'

      expect(page).to have_content(iphone_xs.name)
      expect(page).to have_content(oneplus.name)

    end

  end

  describe "Filter Product with External Storage", js: true do

    scenario "should succesfully filter with External Storage with 32 GB constraint" do

      within('form') do
        check 'q_external_storage_lteq', with: 32
      end

      click_button 'Filter'

      expect(page).to_not have_content(iphone_xs.name)
      expect(page).to_not have_content(oneplus.name)

    end

    scenario "should succesfully filter with External Storage with 128 GB constraint" do

      within('form') do
        check 'q_external_storage_lteq', with: 128
      end

      click_button 'Filter'

      expect(page).to have_content(iphone_xs.name)
      expect(page).to have_content(oneplus.name)

    end

  end

end