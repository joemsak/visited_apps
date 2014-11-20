require 'rails_helper'

RSpec.describe App do
  describe '.unassigned' do
    it 'filters out apps that the given user has assigned' do
      app = create(:app)
      app2 = create(:app)
      app3 = create(:app)

      user = create(:user)
      user2 = create(:user)

      user.add_app(app.id)
      user2.add_app(app2.id)

      expect(App.unassigned(user)).to match_array([app2, app3])
    end
  end
end
