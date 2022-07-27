class InvitesController < ApplicationController
  def new
    @invite = Invite.new
    @event = Event.find(params[:event_id])
  end

  def create
    @invite = Invite.new(invite_params)

    if @invite.save
      redirect_to root_path, notice: "You are now attending this event."
    else
      render :new, notice: "There was an error!"
    end
  end

  private

  def invite_params
    params.require(:invite).permit(:attended_event_id, :attendee_id)
  end
end
