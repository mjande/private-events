class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /events
  def index
    @events = Event.where(id: Invite.where(attendee_id: current_user.id).select(:attended_event_id)).or(Event.where(creator_id: current_user))
  end

  # GET /events/1
  def show
    accepted_invites = Invite.where(attended_event_id: @event.id).where(status: "Attending")
    @attendees = User.where(id: accepted_invites.select(:attendee_id))
    @invite = @event.invites.find_by(attendee_id: current_user.id)
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    if @event.save 
      redirect_to event_url(@event), notice: "Event was successfully created." 
    else
        render :new, status: :unprocessable_entity 
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      redirect_to event_url(@event), notice: "Event was successfully updated." 
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
    redirect_to events_url, notice: "Event was successfully destroyed." 
  end

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:name, :date, :time, :creator_id)
  end
end
