class ActivitiesController < ApplicationController
  def index
    @activities = []
    @activities << current_user.audits
    @activities << current_user.devices.map{ |d| d.audits }
    @activities << current_user.pending_requests.map{ |d| d.audits }
    @activities.flatten!
  end
end
