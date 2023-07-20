class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @post_comments = Comment.where(post_id: @post)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user

    if @post.save
      flash[:success] = 'Post created successfully!'
      redirect_to user_posts_path(current_user)
    else
      flash.now[:error] = "Couldn't create post!"
      render :new, status: :unprocessable_entity
    end

  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
