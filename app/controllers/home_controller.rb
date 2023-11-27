class HomeController < ApplicationController
    def index 
        @posts = Post.order(created_at: :desc)
        render :index 
    end 
end
