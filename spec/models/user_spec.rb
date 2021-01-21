require 'rails_helper'

RSpec.describe User, type: :model do
  subject { FactoryBot.build(:user) }

  it 'creates a valid factory' do
    expect(subject).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :phone }
    it { should validate_presence_of :status }

    it { should validate_uniqueness_of(:email) }
    it { should have_db_index(:email).unique }

    it { should define_enum_for(:status).with_values(%w[active inactive]) }
  end
end
