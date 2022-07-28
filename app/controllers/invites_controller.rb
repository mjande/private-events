class InvitesController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
  end
  
  def create
    @invite = Invite.new(invite_params)
    @event = Event.find(invite_params[:attended_event_id])

    if @invite.save
      redirect_to new_event_invite_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @invite = Invite.find_by(invite_params)
    @invite.destroy

    redirect_to event_path(Event.find(@invite.attended_event_id)), notice: "You are no longer attending this event."
  end

  private

  def invite_params
    params.require(:invite).permit(:attended_event_id, :attendee_id, :status)
  end
end
