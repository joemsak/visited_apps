require 'rails_helper'

RSpec.describe User do
  it { should have_many(:apps).through(:apps_users) }

  describe '#add_app' do
    it 'adds apps with a list of IDs' do
      app = create(:app)
      user = create(:user)

      user.add_app(app.id)

      expect(user.reload.apps).to match_array([app])
    end
  end

  describe '.add_app' do
    it 'adds apps by a list of IDs to specified user' do
      app = create(:app)
      user = create(:user)

      User.add_app(user.id, app.id)

      expect(user.reload.apps).to match_array([app])
    end
  end
end
