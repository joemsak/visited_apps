class UsersController < ApplicationController
  before_filter :authenticate_user!

  def apps
    User.add_apps(params[:id], params[:app_ids])
    render nothing: true
  end
end
