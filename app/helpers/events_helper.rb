module EventsHelper
  def display_invite_button(event)
    return if event.creator_id == session[:current_user_id]

    link_to 'Invite', users_path(event_id: @event.id), class: 'btn btn-primary'
  end

  def display_if_invited(event)
    if EventAttendee.check_invitation(event.id, session[:current_user_id], 1).exists?
      'You are attending this event!'
    elsif EventAttendee.check_invitation(event.id, session[:current_user_id], 0).exists?
      invitation = EventAttendee.check_invitation(event.id, session[:current_user_id], 0)
      link_to 'Accept Invitation', events_attendee_url(invitation.ids), method: :patch, class: 'btn btn-primary'
    else
      render partial: 'info' unless event.creator_id == session[:current_user_id]
    end
  end

  def display_all_attendees(attendee, event_id)
    attendee.username if EventAttendee.check_invitation(event_id, attendee.id, 1).exists?
  end
end
