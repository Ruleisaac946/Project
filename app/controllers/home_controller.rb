class HomeController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :require_permission, except: [:index, :show, :new, :create, :new_comment]

    def require_permission
        if Post.find(params[:id]).user != current_user
          flash[:error] = 'You do not have permission to do that.'
          redirect_to home_path
        end
    end

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
        @post = current_user.posts.build(params.require(:post).permit(:title, :content, :picture))
        if @post.save
            flash[:success] = 'Post has been created'
            post_notify(@post)
            redirect_to home_url 
        else  
            flash.now[:error] = 'Post creation failed'
            flash[:error] = @post.errors.full_messages.join(', ')
            render :new, status: :unprocessable_entity
        end
    end

    def post_notify(post)
        User.all.each do |user|
            Notification.create(
                recipient: user,
                sender: current_user,
                notifiable: post,
                notifiable_type: 'Post',
                content: "#{current_user.name} created a new post: #{post.title}"
            )
        end
    end
        

    def new_comment
        # @user = User.find(params[:id])
        # @post = Post.find(params[:id])
        @comment = Comment.new 
        render :comment 
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        flash[:success] = 'The post item was successfully destroyed.'
        redirect_to home_url, status: :see_other
      end
end
