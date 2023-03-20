require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    # it { is_expected.to validate_acceptance_of(:email)}
    it { is_expected.to validate_presence_of(:password) }
    # it { is_expected.to validate_acceptance_of(:password)}
    it { is_expected.to validate_presence_of(:name) }
    # it { is_expected.to validate_acceptance_of(:name) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:categories).dependent(:destroy) }
    it { is_expected.to have_many(:transfers).dependent(:destroy) }
  end
end
