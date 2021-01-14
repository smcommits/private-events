module UsersHelper
  def display_invitation(event_id, user_id)
    if invitation?(user_id, event_id)
      invitation = EventAttendee.get_invitation(user_id, event_id).ids
      link_to 'Cancel Invite', events_attendee_path(invitation), method: :delete, class: 'btn btn-danger'
    else
      link_to 'Invite', events_attendees_path(event_id: event_id, user_id: user_id), method: :post,
                                                                                     class: 'btn btn-primary'
    end
  end

  def invitation?(user_id, event_id)
    EventAttendee.get_invitation(user_id, event_id).exists?
  end

  def user
    User.find(session[:current_user_id])
  end

  def display_past_events(user)
    if user.attended_events.past.empty?
      render partial: 'users/alert', locals: { text: 'User has no past events' }
    else
      user.attended_events.past.each do |event|
        if EventAttendee.check_invitation(event.id, session[:current_user_id], 1).exists?
          return render partial: 'layouts/event', locals: { event: event }
        end
      end
    end
  end

  def display_upcoming_events(user_id, event)
    return unless EventAttendee.check_invitation(event.id, user_id, 1).exists?

    render partial: 'layouts/event', locals: { event: event }
  end
end
