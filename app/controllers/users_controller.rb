class UsersController < ApplicationController
  before_filter :authenticate_user!

  def apps
    current_user.add_app(params[:app_id])
    @user_apps = current_user.apps
    @unassigned_apps = App.unassigned(current_user)
  end
end
