class FollowedUsersController < ApplicationController
  before_action :find_user

  def create
    current_user.follow(@_user)
    redirect_to @_user
  end

  def destroy
    current_user.unfollow(@_user)
    redirect_to @_user
  end

  private

  def find_user
    @_user ||= User.find_by(username: params[:id])
  end
end
