class AppsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @apps = App.all
    @references = @apps.unassigned(current_user).map do |app|
      { id: app.id, urls: [app.reference_url] }
    end
  end
end
