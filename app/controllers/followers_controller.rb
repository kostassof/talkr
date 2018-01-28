class FollowersController < ApplicationController

  def index
    @followers = @user.followers
  end

  private

  def find_user
    @user ||= User.find_by_username(params[:user_id])
  end
end
