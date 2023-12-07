class HomeController < ApplicationController
  def index
  end

  def followers
    @followers = current_user.followers
  end
end
