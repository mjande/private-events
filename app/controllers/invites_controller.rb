class InvitesController < ApplicationController
  def create
    @invite = Invite.new(invite_params)
    @event = Event.find(params[:event_id])

    if @invite.save
      redirect_to event_invites_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @event = Event.find(params[:event_id])
  end

  def update
    @invite = Invite.find(params[:id])
    if @invite.update(invite_params)
      redirect_to Event.find(invite_params[:attended_event_id]), notice: "You are now attending this event."
    else
      render Event.find(invite_params[:attended_event_id]), notice: "There was an error."
    end
  end

  def destroy
    @invite = Invite.find(params[:id])
    @invite.destroy

    redirect_to event_invites_path(Event.find(@invite.attended_event_id)), notice: "You are no longer attending this event."
  end

  private

  def invite_params
    params.require(:invite).permit(:attended_event_id, :attendee_id, :status)
  end
end
