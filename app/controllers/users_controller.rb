class UsersController < ApplicationController
  def show
    @attended_events = Event.where(id: current_user.invites.select(:attended_event_id)).each
  end
end