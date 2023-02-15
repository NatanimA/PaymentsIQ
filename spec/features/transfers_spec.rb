require 'rails_helper'

RSpec.describe TransfersController, type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let(:category) { FactoryBot.create(:category, user:) }

  before(:each) do
    sign_in user
  end
  describe 'Index Of Transfers' do
    it 'Should Display the name of the category' do
      FactoryBot.create_list(:transfer, 6, author: user, category:)
      visit category_path(category)
      expect(page).to have_content(category.name)
    end
    it 'Should display the name of transfers' do
      FactoryBot.create_list(:transfer, 6, author: user, category:)
      visit category_path(category)
      expect(page).to have_content(category.transfers[0].name)
    end

    it 'Should redirect to create transfer page' do
      visit category_path(category)
      click_link('Scan')
      expect(page).to have_content('Make Transfers')
    end

    it 'Should Fill in the inputs' do
      visit new_category_transfer_path(category)
      fill_in 'Name', with: 'Apple'
      fill_in 'Amount', with: Faker::Commerce.price(range: 1..4000)
      click_button('Transfer')
      expect(page).to have_content('Transfers')
    end
  end
end
