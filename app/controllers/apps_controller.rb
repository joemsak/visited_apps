class AppsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user_apps = current_user.apps
    @unassigned_apps = App.unassigned(current_user)
    @references = @unassigned_apps.map do |app|
      { id: app.id, urls: [app.reference_url] }
    end
  end
end
