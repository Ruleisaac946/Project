class ExploreController < ApplicationController
    def index
        @posts = Post.search(params[:search])
        render :index
    end

    def post_params 
        params.require(:post).permit(:content)
    end 
end
