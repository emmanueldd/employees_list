class GoogleCalendarWrapper
  def initialize(current_resource)
    configure_client(current_resource)
  end
  def configure_client(current_resource)
    @client = Google::APIClient.new
    @client.authorization.access_token = current_resource.token
    @client.authorization.refresh_token = current_resource.refresh_token
    @client.authorization.client_id = ENV['GOOGLE_CLIENT_ID']
    @client.authorization.client_secret = ENV['GOOGLE_CLIENT_SECRET']
    @client.authorization.refresh!
    @service = @client.discovered_api('calendar', 'v3')
    response = @client.execute(api_method: @service.calendar_list.list)

  end

  def calendar_id(schedule)
    response = @client.execute(api_method:
      @service.calendar_list.list)
    calendars = JSON.parse(response.body)
    calendar = calendars["items"].select {|cal|
      cal["id"].downcase == schedule.calendar_id}
    calendar["id"]
  end

  # def add_event
  #   event = {
  #     summary: "Board of Directors Meeting",
  #     location: "Conference Room - 1",
  #     start: {dateTime: 2016-03-20T11:04:00+0000},
  #     end: {dateTime: 2016-03-20T12:04:00+0000},
  #     description: "important meeting with the board",
  #   }
  #   @client.execute(api_method: @service.events.insert,
  #     parameters: {'calendarId': calendar_id,
  #       'sendNotifications': true},
  #     body: JSON.dump(event),
  #     headers: {'Content-Type': 'application/json'}
  #   )
  # end

end
