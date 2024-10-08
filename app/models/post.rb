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
    has_one_attached :picture
    def self.search(search)
        if search 
            content = Post.find_by(content: search)
            if content 
                self.where(post_id: post)
            else
                Post.all
            end
        else
            Post.all
        end
    end
    belongs_to(
        :user, 
        class_name: 'User',
        foreign_key: 'user_id',
        inverse_of: :posts
    )
    has_many(
        :comments, 
        class_name: 'Comment',
        foreign_key: 'post_id', 
        inverse_of: :post, 
        dependent: :destroy
    )
    has_many :reposts
    has_many :repost_users, through: :reposts, source: :user
    validates :title, presence: true
    # has_many :likes, as: :likeable

    has_many :notifications, as: :notifiable, dependent: :destroy
    after_create :create_notifications

    def create_notifications
        User.where.not(id: user_id).each do |user|
          Notification.create(
            recipient: user,
            sender: user,
            notifiable: self,
            notifiable_type: 'Post',
            content: "#{user.name} created a new post from post.rb: #{title}"
          )
        end
      end
  
end
