require 'rails_helper'

RSpec.describe UsersController do
  describe 'PUT #apps' do
    it 'associates apps by ID to the user' do
      app = create(:app)
      user = create(:user)

      sign_in(user)

      put :apps, id: user.id, app_id: app.id

      expect(user.reload.apps).to match_array([app])
    end
  end
end
