class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :apps_users
  has_many :apps, through: :apps_users

  def add_apps(app_ids)
    app_ids.each do |id|
      apps << App.find(id)
    end
  end

  def self.add_apps(user_id, app_ids)
    User.find(user_id).add_apps(app_ids)
  end
end
