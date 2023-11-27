class AddNotificationPreferencesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :notification_preferences, :text
  end
end
