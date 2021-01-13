class EventsAttendeesController < ApplicationController
  def create 
    user = User.find(session[:current_user_id])
    attendee = EventAttendee.create(attendee_id: user.id, attended_event_id: params[:event_id])
    redirect_to event_path(params[:event_id])

  end

  def destroy
    user = User.find(session[:current_user_id])
    attendance = EventAttendee.find_by(attendee_id: user.id,  attended_event_id: params[:event_id])
    attendance.destroy
    redirect_to event_path(params[:event_id])
  end


end
