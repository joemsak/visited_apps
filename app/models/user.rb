class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :apps_users
  has_many :apps, through: :apps_users

  def add_app(app_id)
    apps << App.find(app_id)
  end

  def self.add_app(user_id, app_id)
    User.find(user_id).add_app(app_id)
  end
end
