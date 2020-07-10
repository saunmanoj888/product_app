require 'rails_helper'

RSpec.feature "Sessions", type: :feature do

  let(:user) {
    FactoryBot.create(:user)
  }

  before(:each) do
    user
    visit new_user_session_path
  end

  describe "Login with existing User", js: true do

    context 'When User details are correct' do

      scenario "should be successfully log in" do

        within('form') do
          fill_in 'Email', with: user.email
          fill_in 'Password', with: user.password
        end

        click_button 'Log in'
        expect(page).to have_content('Signed in successfully.')
      end

    end

    context 'When User details are incorrect' do

      scenario "should not log in" do

        within('form') do
          fill_in 'Email', with: user.email
          fill_in 'Password', with: 'xyzabc'
        end

        click_button 'Log in'
        expect(page).to have_content('Invalid Email or password.')
      end

    end

  end

end