class EventsAttendeesController < ApplicationController
  def create
    attendee_id = params[:user_id]
    @attended_event_id = params[:event_id]
    attendance = EventAttendee.new(attendee_id: attendee_id, attended_event_id: @attended_event_id)
    if attendance.save
      flash[:success] = 'Invitation Successful'
    else
      flash[:danger] = 'Oops, something went wrong!'
    end

    redirect_to users_url(event_id: @attended_event_id)
  end

  def update
    invitation = EventAttendee.find(params[:id])
    invitation.update(status: :accepted)
    flash[:success] = 'Invitation Accepted!'
    redirect_to user_path(session[:current_user_id])
  end

  def destroy
    attendance = EventAttendee.find(params[:id])
    attendance.destroy
    redirect_to users_url(event_id: attendance.attended_event_id)
  end
end
