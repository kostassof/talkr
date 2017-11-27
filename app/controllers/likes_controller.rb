class LikesController < ApplicationController
  before_action :require_login

  def create
    current_user.like(talk)
    redirect_to root_path
  end

  def destroy
    current_user.unlike(talk)
    redirect_to root_path
  end

  private

  def talk
    @_talk ||= Talk.find(params[:id])
  end
end
