class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @all_users = User.all
  end

  def show
    @user = User.find(params[:id])
    @recent_posts = @user.three_recent_posts
  end
end
