# == Schema Information
#
# Table name: likes
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  likeable_id :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_likes_on_likeable_id  (likeable_id)
#  index_likes_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Like < ApplicationRecord
  belongs_to :likeable, polymorphic: true  
  belongs_to :user
end
