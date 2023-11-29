class ExploreController < ApplicationController
    def index
        @posts = Post.all
        if params[:search_by_title] && params[:search_by_title] != ""
            @posts = @posts.where("title like ?", "%#{params[:search_by_title]}%")
        end
        render :index
    end
end
