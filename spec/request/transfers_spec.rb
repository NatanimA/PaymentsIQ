require 'rails_helper'

RSpec.describe TransfersController, type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:category) { FactoryBot.create(:category, user:) }
  let(:transfer) { FactoryBot.create(:transfer, author: user, category:) }
  before { login_as user }

  describe 'GET #INDEX' do
    it 'Should Respond Successfully' do
      get category_path(category)
      expect(response).to have_http_status(200)
    end

    it 'Should belong to the user' do
      expect(transfer.author).to eq(user)
    end

    it 'Should belong to the category' do
      expect(transfer.category).to eq(category)
    end
  end
end
