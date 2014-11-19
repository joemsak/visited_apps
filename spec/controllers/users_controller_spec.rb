require 'rails_helper'

RSpec.describe UsersController do
  describe 'PUT #apps' do
    it 'associates apps by ID to the user' do
      app1 = create(:app)
      app2 = create(:app)
      app3 = create(:app)
      user = create(:user)

      sign_in(user)

      put :apps, id: user.id, app_ids: [app1.id, app3.id]

      expect(user.reload.apps).to match_array([app1, app3])
    end
  end
end
