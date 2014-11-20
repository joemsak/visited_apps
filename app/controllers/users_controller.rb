class UsersController < ApplicationController
  before_filter :authenticate_user!

  def apps
    User.add_app(params[:id], params[:app_id])
    render nothing: true
  end
end
