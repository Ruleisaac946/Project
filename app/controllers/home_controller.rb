class HomeController < ApplicationController
    def index 
        @posts = Post.order(created_at: :asc)
        render :index 
    end 

    def show
        @post = Post.find(params[:id])
        render :show 
    end 

    def new
        @post = Post.new
        render :new 
    end

    def create 
        @post = Post.new(params.require(:post).permit(:content))
        if @post.save
            flash[:success] = 'Post has been created'
            redirect_to home_url 
        else  
            flash.now[:error] = 'Post creation failed'
            render :new, status: :unprocessable_entity
        end
    end
end
