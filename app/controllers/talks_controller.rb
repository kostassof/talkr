class TalksController < ApplicationController

  def show
    @talk = Talk.find(params[:id])
  end

  def create
    talk = current_user.talks.create(talk_params)
    redirect_to root_path, redirect_options_for(talk)
  end

  private

  def talk_params
    { content: content_from_params }
  end

  def content_from_params
    TextTalk.new(content_params)
  end

  def content_params
    params.require(:talk).require(:content).permit(:body)
  end

  def redirect_options_for(talk)
    if talk.persisted?
      { notice: "Talked successfully." }
    else
      { alert: "I'm sorry but you cannot talk. :(" }
    end
  end
end
