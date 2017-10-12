class GoogleCalendarWrapper
  def initialize(current_resource)
    configure_client(current_resource)
  end
  def configure_client(current_resource)
    @current_resource = current_resource
    @client = Google::APIClient.new
    @client.authorization.grant_type = 'refresh_token'
    @client.authorization.access_token = @current_resource.access_token
    @client.authorization.refresh_token = @current_resource.refresh_token
    @client.authorization.client_id = ENV['GOOGLE_CLIENT_ID']
    @client.authorization.client_secret = ENV['GOOGLE_CLIENT_SECRET']
    @client.authorization.refresh!
    @service = @client.discovered_api('calendar', 'v3')
  end

  def create_event(booking)
    event_props = {
      summary: booking.title,
      location: booking.address,
      start: {dateTime: booking.start_time.rfc3339},
      end: {dateTime: booking.end_time.rfc3339},
      description: "Owfleek",
    }
    event = @client.execute(:api_method => @service.events.insert,
      :parameters => {'calendarId' => @current_resource.calendar_id,
        'sendNotifications' => true},
      :body => JSON.dump(event_props),
      :headers => {'Content-Type' => 'application/json'}
    )
    booking.update(google_event_id: event.data.id)
  end

  def update_event(booking)
    if booking.google_event_id.present?
      result = @client.execute(:api_method => @service.events.get, :parameters => {'calendarId' => @current_resource.calendar_id, 'eventId' => booking.google_event_id } )
      event = result.data
      event.summary = booking.title
      event.start.dateTime = booking.start_time
      event.end.dateTime = booking.end_time
      event.description = booking.description
      event.location = booking.address
      result = client.execute(
        :api_method => service.events.update,
        :parameters => {'calendarId' => @current_resource.calendar_id, 'eventId' =>  @event.google_event_id},
        :body_object => event,
        :headers => {'Content-Type' => 'application/json'}
      )
    end
  end

  def destroy_event(booking)
    # necessary ?
    if booking.google_event_id.present?
      result = @client.execute(
        :api_method => @service.events.delete,
        :parameters => {'calendarId' => @current_resource.calendar_id, 'eventId' =>  @event.google_event_id},
      )
    end
  end
end
