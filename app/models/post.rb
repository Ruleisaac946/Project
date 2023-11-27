# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  content    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord
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
end
