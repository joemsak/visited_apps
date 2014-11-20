require 'rails_helper'

RSpec.describe AppsController do
  describe 'GET #index' do
    it 'supplies a list of reference URLs and app IDs for the cache time script' do
      sign_in(create(:user))

      create(:app, id: 9999, reference_url: 'http://app.com/assets/foo.js')

      get :index

      expect(assigns[:references]).to eq([ { id: 9999, urls: ['http://app.com/assets/foo.js'] } ])
    end
  end
end
