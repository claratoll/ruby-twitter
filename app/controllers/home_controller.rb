class HomeController < ApplicationController
  def index
  end

  def users
    @users = User.all
  end

  def follow
    user = User.find(params[:id])
    current_user.follow(user)
    redirect_to users_path
  end

  def unfollow
    user = User.find(params[:id])
    current_user.unfollow(user)
    redirect_to users_path
  end
end
