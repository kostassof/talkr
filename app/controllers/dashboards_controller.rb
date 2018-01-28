class DashboardsController < ApplicationController
  def show
    @talk = Talk.new
    @talks = current_user.timeline_talks
  end
end
