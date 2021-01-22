require 'rails_helper'

describe 'Update a User', type: :feature do
  let!(:user1) { FactoryBot.create(:user, name: 'Jerad', email: 'jerad@trainual.com') }

  describe 'User saving successfully' do
    scenario 'Saves without validation errors', js: true do
      visit root_path

      expect(page).to have_content('Jerad')

      click_link('Edit')
      fill_in('Name', with: 'Steven')
      click_button('Save')

      expect(page).to have_content('Steven')
    end
  end

  describe 'Validation errors' do
    let!(:user2) { FactoryBot.create(:user, email: 'steven@trainual.com') }

    scenario 'Fails to save with validation errors', js: true do
      visit root_path

      within(find_by_id("row_#{user1.id}")) do
        click_link('Edit')
      end

      fill_in('Email', with: 'steven@trainual.com')
      click_button('Save')

      expect(page).to have_content('Email has already been taken')
    end
  end
end
