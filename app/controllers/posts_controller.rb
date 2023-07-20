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
end
