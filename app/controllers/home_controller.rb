class HomeController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :require_permission, except: [:index, :show, :new, :create]
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
end
