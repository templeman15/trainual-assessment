require 'rails_helper'

describe 'Destroy', type: :feature do
  let!(:user1) { FactoryBot.create(:user, name: 'Steven') }
  let!(:user2) { FactoryBot.create(:user, name: 'Matt') }

  scenario 'Deleting a user', js: true do
    visit root_path

    expect(page).to have_content('Steven')
    expect(page).to have_content('Matt')

    within(find_by_id("row_#{user1.id}")) do
      accept_confirm do
        click_link 'Delete'
      end
    end

    expect(page).not_to have_content('Steven')
    expect(page).to have_content('Matt')
  end
end
