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

  describe '#has_app?' do
    it 'returns true / false depending on the association' do
      app = create(:app)
      app2 = create(:app)

      user = create(:user)
      user.add_app(app.id)

      expect(user).to have_app(app)
      expect(user).not_to have_app(app2)
    end
  end
end
