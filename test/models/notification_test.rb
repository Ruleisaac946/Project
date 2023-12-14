# == Schema Information
#
# Table name: notifications
#
#  id              :bigint           not null, primary key
#  content         :text
#  notifiable_type :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  notifiable_id   :bigint           not null
#  recipient_id    :bigint           not null
#  sender_id       :bigint           not null
#
# Indexes
#
#  index_notifications_on_notifiable    (notifiable_type,notifiable_id)
#  index_notifications_on_recipient_id  (recipient_id)
#  index_notifications_on_sender_id     (sender_id)
#
# Foreign Keys
#
#  fk_rails_...  (recipient_id => users.id)
#  fk_rails_...  (sender_id => users.id)
#
require "test_helper"

class NotificationTest < ActiveSupport::TestCase
  enum notification_type: { like: 0, comment: 1, follow: 2, mention: 3, post: 4 }
  # test "the truth" do
  #   assert true
  # end
end
