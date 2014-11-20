class App < ActiveRecord::Base
  has_many :apps_users
  has_many :users, through: :apps_users

  def self.unassigned(user)
    joins('left join apps_users on app_id = apps.id')
    .where('user_id IS NULL or user_id != ?', user.id)
  end
end
