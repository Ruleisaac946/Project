class CommentsController < ApplicationController
    def new 
        @post = Post.find(params[:id])
        @comment = Comment.new
        render :new
    end
    def create 
        @post = Post.find(params[:id])
        @comment = @post.comments.build(params.require(:comment).permit(:content))
        @comment.user = current_user
        if @comment.save
            flash[:success] = "Comment has been created"
            redirect_to post_show_url(@post)
        else
            flash.now[:error] = "Comment could not be created"
            flash[:error] = @comment.errors.full_messages.join(', ')
            render :new, status: :unprocessable_entity
        end
    end
end
