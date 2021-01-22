require 'rails_helper'

describe 'Visiting users index', type: :feature do
  describe 'Paginated users' do
    before(:each) { FactoryBot.create_list(:user, 30) }

    scenario 'Visiting the first page of users' do
      visit root_path

      expect(page).to have_selector('table tbody tr', count: 25)
    end

    scenario 'Visiting the second page of users' do
      visit root_path
      click_link('2')

      expect(page).to have_selector('table tbody tr', count: 5)
    end
  end

  describe 'Searching users' do
    let!(:user1) { FactoryBot.create(:user, name: 'Steven') }
    let!(:user2) { FactoryBot.create(:user, name: 'Matt') }
    let!(:user3) { FactoryBot.create(:user, name: 'Jared') }
    let!(:user4) { FactoryBot.create(:user, name: 'Zach') }

    scenario 'Searching by name' do
      visit root_path
      fill_in('Name/Email/Phone', with: user1.name)
      click_button('Search')

      expect(page).to have_selector('table tbody tr', count: 1)
      expect(page).to have_content user1.name
    end

    scenario 'Searching by email' do
      visit root_path
      fill_in('Name/Email/Phone', with: user2.email)
      click_button('Search')

      expect(page).to have_selector('table tbody tr', count: 1)
      expect(page).to have_content user2.email
    end

    scenario 'Searching by phone' do
      visit root_path
      fill_in('Name/Email/Phone', with: user3.phone)
      click_button('Search')

      expect(page).to have_selector('table tbody tr', count: 1)
      expect(page).to have_content user3.phone
    end

    scenario 'No user is found' do
      visit root_path
      fill_in('Name/Email/Phone', with: 'No matching record')
      click_button('Search')

      expect(page).to have_selector('table tbody tr', count: 0)
    end

    scenario 'Blank search term is passed' do
      visit root_path
      fill_in('Name/Email/Phone', with: '')
      click_button('Search')

      expect(page).to have_selector('table tbody tr', count: 4)
    end
  end

  describe 'Sorting users' do
    let!(:user1) { FactoryBot.create(:user, name: 'Steven', email: '3_steven@gmail.com') }
    let!(:user2) { FactoryBot.create(:user, name: 'Matt', email: '1_matt@gmail.com') }
    let!(:user3) { FactoryBot.create(:user, name: 'Jared', email: '4_jared@gmail.com') }
    let!(:user4) { FactoryBot.create(:user, name: 'Zach', email: '2_zach@gmail.com') }

    scenario 'Sorting by name' do
      visit root_path
      click_link 'Name'

      expect(user3.name).to appear_before(user2.name)
      expect(user2.name).to appear_before(user1.name)
      expect(user1.name).to appear_before(user4.name)
    end

    scenario 'Sorting by email' do
      visit root_path
      click_link 'Email'

      expect(user2.email).to appear_before(user4.email)
      expect(user4.email).to appear_before(user1.email)
      expect(user1.email).to appear_before(user3.email)
    end
  end
end
