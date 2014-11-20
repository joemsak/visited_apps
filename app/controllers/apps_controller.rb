class AppsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @apps = App.all
    @references = @apps.map do |app|
      { id: app.id, url: app.reference_url }
    end
  end
end
