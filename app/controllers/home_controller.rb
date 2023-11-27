class HomeController < ApplicationController
    def index 
        @posts = Post.order(created_at: :asc)
        render :index 
    end 
end
