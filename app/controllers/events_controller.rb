class EventsController < ApplicationController
  before_action :require_login, only: %i[new create]
  def index
    @past_events = Event.past
    @future_events = Event.future
  end

  def new
    @event = Event.new
    @user = User.find(session[:current_user_id])
  end

  def create
    @user = User.find(session[:current_user_id])
    @event = @user.created_events.build(event_params)
    if @event.save
      redirect_to @event
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:title, :event_date, :description)
  end
end
