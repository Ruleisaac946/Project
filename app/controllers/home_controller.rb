class HomeController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :require_permission, except: [:index, :show, :new, :create, :new_comment]
    def index 
        @posts = Post.order(created_at: :asc)
        # @individualPost = Post.find(params[:p])
        # @comments = @individualPost.comments
        render :index 
    end 

    def show
        @post = Post.find(params[:id])
        @comments = @post.comments
        render :show 
    end 

    def new
        @post = Post.new
        render :new 
    end

    def create 
        # @post = Post.new(params.require(:post).permit(:content))
        @post = current_user.posts.build(params.require(:post).permit(:title, :content))
        if @post.save
            flash[:success] = 'Post has been created'
            redirect_to home_url 
        else  
            flash.now[:error] = 'Post creation failed'
            flash[:error] = @post.errors.full_messages.join(', ')
            render :new, status: :unprocessable_entity
        end
    end

    def new_comment
        # @user = User.find(params[:id])
        # @post = Post.find(params[:id])
        @comment = Comment.new 
        render :comment 
    end
end
