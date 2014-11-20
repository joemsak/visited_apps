class AppsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @apps = App.all
  end
end
