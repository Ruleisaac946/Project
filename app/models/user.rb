# == Schema Information
#
# Table name: users
#
#  id                       :bigint           not null, primary key
#  email                    :string           default(""), not null
#  encrypted_password       :string           default(""), not null
#  is_public                :boolean
#  name                     :string
#  notification_preferences :text
#  remember_created_at      :datetime
#  reset_password_sent_at   :datetime
#  reset_password_token     :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_one_attached :profile_picture
  has_one_attached :cover_photo

  has_many(
    :posts,
    class_name: 'Post',
    foreign_key: 'user_id',
    inverse_of: :user,
    dependent: :destroy
  )
  has_many(
    :comments,
    class_name: 'Comment',
    foreign_key: 'user_id', 
    inverse_of: :user, 
    dependent: :destroy 
  )
  has_many :reposts
  has_many :reposted_posts, through: :reposts, source: :post
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
  # Model validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
      
  # Other model associations, methods, or validations can be added as needed
        
  # Example method for updating notification preferences
  def update_notification_preferences(preferences)
    update(notification_preferences: preferences)
  end
end
