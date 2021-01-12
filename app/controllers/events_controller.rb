class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new 
    @event = Event.new
    @user = User.find(session[:current_user_id])
  end

  def create
    user = User.find(session[:current_user_id])
    event = user.created_events.build(event_params)
    if event.save
      redirect_to event_url(event)
    end
  end

  def show 
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :event_date, :description)
  end
end
