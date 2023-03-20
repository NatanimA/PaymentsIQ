require 'rails_helper'

RSpec.describe CategoriesController, type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let(:category) { FactoryBot.create(:category, user:) }
  let(:transfers) { FactoryBot.create_list(:transfer, 6, author: user, category:) }

  before(:each) do
    sign_in user
  end

  describe 'Visits Index page' do
    it 'Should see all the categories listed for the user' do
      visit categories_path
      expect(page).to have_content('Categories')
    end
    it 'Should Redirect the user to categories Show' do
      visit categories_path
      expect(page).to have_css('.container .transfer-list-flex-container a')
      page.all('.container .transfer-list-flex-container a').each do |category_page|
        visit category_page[:href]
        expect(page).to have_content(user.email)
      end
    end

    it 'Should Redirect to create Category page when btn clicked' do
      visit categories_path
      click_link('Add Category')
      expect(page).to have_content('Create Category')
    end

    it 'Should Create a new Category and redirect to Home page' do
      visit new_category_path
      fill_in 'Name', with: 'Apple'
      fill_in 'Icon', with: Faker::Internet.url

      click_button('Add Category')
      expect(page).to have_content(user.email)
    end
  end
end
