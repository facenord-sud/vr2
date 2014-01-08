class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    @events = Event.future
    @sticky = Event.sticky
    @old_events = Event.past_by_month

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def old
    render json: Event.old
  end
end
