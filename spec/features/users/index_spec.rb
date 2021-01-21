require 'rails_helper'

describe 'visiting Users index', type: :feature do
  before(:each) { FactoryBot.create_list(:user, 30) }

  scenario 'when visiting the first page of users' do
    visit root_path

    expect(page).to have_content 'Users'
    expect(page).to have_selector('table tbody tr', count: 25)
  end

  scenario 'when visiting the second page of users' do
    visit root_path
    click_link('2')

    expect(page).to have_content 'Users'
    expect(page).to have_selector('table tbody tr', count: 5)
  end
end
