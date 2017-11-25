class TalksController < ApplicationController
  def create
    talk = current_user.talks.create(talk_params)
    redirect_to root_path, redirect_options_for(talk)
  end

  private

  def talk_params
    params.require(:talk).permit(:body)
  end

  def redirect_options_for(talk)
    if talk.persisted?
      { notice: "Talked successfully." }
    else
      { alert: "I'm sorry but you cannot talk. :(" }
    end
  end
end
