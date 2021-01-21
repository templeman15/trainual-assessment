require 'rails_helper'

describe 'visiting Users index', type: :feature do
  before(:each) { FactoryBot.create_list(:user, 5) }

  it 'renders the list of Users' do
    visit root_path

    expect(page).to have_content 'Users'
    expect(page).to have_selector('table tbody tr', count: 5)
  end
end
