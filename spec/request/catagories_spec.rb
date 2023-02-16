require 'rails_helper'

RSpec.describe CategoriesController, type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:category) { FactoryBot.create(:category, user:) }
  before { login_as user }
  describe 'Get #Index' do
    before do
      # Create Category for the current User
      FactoryBot.create_list(:category, 3, user:)
      # Create Category for Other Users
      FactoryBot.create_list(:category, 2)
    end
    it 'returns a success response' do
      get categories_path
      expect(response).to have_http_status(200)
    end

    it 'Returns the correct number of categories' do
      get categories_path
      expect(assigns(:categories).count).to eq(3)
    end

    it 'Returns only categories that belongs to the user' do
      get categories_path
      assigns(:categories).each do |category|
        expect(category.user).to eq(user)
      end
    end
  end

  describe 'GET #Show' do
    before do
      # Create Transfers In that Category
      FactoryBot.create_list(:transfer, 6, author: user, category:)
    end

    it 'Should return success response' do
      get category_path(category)
      expect(response).to have_http_status(200)
    end

    it 'Should have the same count of transfers' do
      get category_path(category)
      expect(assigns(:transfers).count).to eq(6)
    end

    it 'Should match Transfers with their category' do
      get category_path(category)
      assigns(:transfers).each do |transfer|
        expect(transfer.category).to eq(category)
      end
    end

    it 'Should match Transfers with their User' do
      get category_path(category)
      assigns(:transfers).each do |transfer|
        expect(transfer.author).to eq(user)
      end
    end
  end

  describe 'POST #Create' do
    it 'Should create new Category with valid inputs' do
      post categories_path(category),
           params: { new_category: { name: 'Gym Fee', icon: Faker::Internet.url, user: } }
      expect(response).to have_http_status(302)
    end
  end
end
