require 'rails_helper'

describe 'Create a User', type: :feature do
  let!(:user1) { FactoryBot.create(:user, name: 'Jerad') }
  let!(:user2) { FactoryBot.create(:user, name: 'Matt') }

  describe 'User saving successfully' do
    scenario 'Saves without validation errors', js: true do
      visit root_path
      click_link('Add User')

      fill_in('Name', with: 'Steven')
      fill_in('Email', with: 'steven@trainual.com')
      fill_in('Title', with: 'Senior Engineer')
      fill_in('Phone', with: '928.555.5555')

      click_button('Save')

      expect(page).to have_content('Steven')
    end
  end

  describe 'Validation errors' do
    let!(:user3) { FactoryBot.create(:user, email: 'steven@trainual.com') }

    scenario 'Fails to save with validation errors', js: true do

      visit root_path
      click_link('Add User')

      fill_in('Name', with: 'Steven')
      fill_in('Email', with: 'steven@trainual.com')
      fill_in('Title', with: 'Senior Engineer')
      fill_in('Phone', with: '928.555.5555')

      click_button('Save')

      expect(page).to have_content('Email has already been taken')
    end
  end
end
