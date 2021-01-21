require 'rails_helper'

RSpec.describe UsersHelper, type: :helper do
  describe '#status_color' do
    subject { FactoryBot.build(:user) }

    context 'when users status is active' do
      before { subject.status = :active }

      it { expect(helper.status_color(subject)).to eq('text-success') }
    end

    context 'when users status is inactive' do
      before { subject.status = :inactive }

      it { expect(helper.status_color(subject)).to eq('text-danger') }
    end
  end
end
