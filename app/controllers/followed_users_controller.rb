class FollowedUsersController < ApplicationController
  before_action :find_user, only: [:destroy]

  def create
    user_to_follow = current_user
    current_user.follow(user_to_follow)
    redirect_to user_to_follow
  end

  def destroy
    current_user.unfollow(@_user)
    redirect_to user_to_unfollow
  end

  private

  def find_user
    @_user ||= User.find_by(username: params[:id])
  end
end
