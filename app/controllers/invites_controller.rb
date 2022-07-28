class InvitesController < ApplicationController
  def create
    @invite = Invite.new(invite_params)

    if @invite.save
      redirect_to event_path(Event.find(@invite.attended_event_id)), notice: "You are now attending this event."
    else
      render :new, notice: "There was an error!"
    end
  end

  def destroy
    @invite = Invite.find_by(invite_params)
    @invite.destroy

    redirect_to event_path(Event.find(@invite.attended_event_id)), notice: "You are no longer attending this event."
  end

  private

  def invite_params
    params.require(:invite).permit(:attended_event_id, :attendee_id)
  end
end
