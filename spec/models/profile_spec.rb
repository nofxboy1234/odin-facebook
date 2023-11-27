require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe '#user' do
    context 'when a profile belongs to a user' do
      subject!(:profile) do
        create(:profile)
      end

      let!(:user) do
        create(:user)
      end

      before do
        # user.profile = profile
        profile.update!(user:)
      end

      it 'returns the user it belongs to' do
        expect(profile.user).to eq(user)
      end
    end
  end
end
