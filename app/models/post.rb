# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  content    :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord
    belongs_to(
        :user, 
        class_name: 'User',
        foreign_key: 'user_id',
        inverse_of: :posts
    )
    has_many :reposts
    has_many :repost_users, through: :reposts, source: :user
    validates :title, presence: true
  
end
