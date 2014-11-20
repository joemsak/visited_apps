require 'rails_helper'

RSpec.describe UsersController do
  describe 'PUT #apps' do
    it 'associates apps by ID to the current user' do
      app = create(:app)
      user = create(:user)

      sign_in(user)

      put :apps, app_id: app.id, format: :js

      expect(user.reload.apps).to match_array([app])
    end
  end
end
