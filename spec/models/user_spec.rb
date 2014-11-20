require 'rails_helper'

RSpec.describe User do
  it { should have_many(:apps).through(:apps_users) }

  describe '#add_apps' do
    it 'adds apps with a list of IDs' do
      app1 = create(:app)
      app2 = create(:app)
      user = create(:user)

      user.add_apps([app1.id, app2.id])

      expect(user.reload.apps).to match_array([app1, app2])
    end
  end

  describe '.add_apps' do
    it 'adds apps by a list of IDs to specified user' do
      app1 = create(:app)
      app2 = create(:app)
      user = create(:user)

      User.add_apps(user.id, [app1.id, app2.id])

      expect(user.reload.apps).to match_array([app1, app2])
    end
  end
end
