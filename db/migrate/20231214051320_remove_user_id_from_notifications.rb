class RemoveUserIdFromNotifications < ActiveRecord::Migration[7.0]
  def change
    remove_reference :notifications, :user, null: false, foreign_key: true, index: true
  end
end
