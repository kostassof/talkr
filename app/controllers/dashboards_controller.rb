class DashboardsController < ApplicationController
  def show
    @talk = Talk.new
    @talks = current_user.talks
  end
end
