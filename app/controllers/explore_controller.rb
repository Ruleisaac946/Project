class ExploreController < ApplicationController
    def index
        @posts = Post.all
        if params[:search_by_user] && params[:search_by_user] != ""
            @posts = @posts.joins(:user).where("users.name like ?", "%#{params[:search_by_user]}%")
        end
        render :index
    end
end
