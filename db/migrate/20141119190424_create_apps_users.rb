class CreateAppsUsers < ActiveRecord::Migration
  def change
    create_table :apps_users do |t|
      t.references :app, index: true, null: false
      t.references :user, index: true, null: false

      t.timestamps
    end
  end
end
