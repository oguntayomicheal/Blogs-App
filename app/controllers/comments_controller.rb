class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]

    post = Post.find(params[:post_id])
    if @comment.save
      flash[:success] = 'Comment created successfully!'
      redirect_to user_post_path(current_user, post)
    else
      flash.now[:error] = "Couldn't create comment!"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
