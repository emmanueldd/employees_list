Pro.create!([
  {first_name: "", last_name: "", nickname: "", email: "e.derozin@gmail.com", password: 'qaqawete', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2017-10-13 10:27:08", last_sign_in_at: "2017-10-13 10:27:08", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", avatar: nil, provider: "google_oauth2", uid: "106202177754918959321", tokens: {}, confirmation_token: nil, confirmed_at: nil, confirmation_sent_at: nil, unconfirmed_email: nil, failed_attempts: 0, unlock_token: nil, locked_at: nil, access_token: "ya29.GlvjBKdQyqbuiuyAQNuCla9rKK__3pc5IBA1CzK6vYM0dVWD6V14xMzCqDV64o8F6HpZtxQnptoyN54Tuw-HySYv8BGhS1C4jk6TimxkUpqA3sfYibqG-7uBHa-M", refresh_token: "1/DJKOzHo2k2lqwzU43-qHpxtv29Edhb8Ejf7t4Tlhxbk", calendar_id: nil}
])
User.create!([
  {first_name: "", last_name: "", nickname: "", avatar: nil, male: nil, description: nil, birth_date: nil, email: "test@test.fr", password: 'qaqawete', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2017-10-13 10:28:34", last_sign_in_at: "2017-10-13 10:28:34", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"}
])
Mission.create!([
  {parent_id: nil, pro_id: 1, name: "Box braids", description: "Box braids", price: "30.0", duration: 60, published: false},
  {parent_id: 1, pro_id: 1, name: "Box braids effet court", description: "Box braids effet court", price: "40.0", duration: 60, published: false},
  {parent_id: 1, pro_id: 1, name: "Box braids effet long", description: "Box braids effet long", price: "50.0", duration: 60, published: false}
])
Booking.create!([
  {pro_id: 1, user_id: 1, mission_id: 3, price: nil, start_time: nil, end_time: nil, status: "pending", comment: nil, google_event_id: nil},
  {pro_id: 1, user_id: 1, mission_id: 2, price: nil, start_time: nil, end_time: nil, status: "pending", comment: nil, google_event_id: nil},
  {pro_id: 1, user_id: 1, mission_id: 2, price: nil, start_time: nil, end_time: nil, status: "pending", comment: nil, google_event_id: nil}
])
BusinessHour.create!([
  {pro_id: 1, date: nil, week_day: 0, start_time: nil, end_time: nil, open: true},
  {pro_id: 1, date: nil, week_day: 1, start_time: nil, end_time: nil, open: true},
  {pro_id: 1, date: nil, week_day: 2, start_time: nil, end_time: nil, open: true},
  {pro_id: 1, date: nil, week_day: 3, start_time: nil, end_time: nil, open: true},
  {pro_id: 1, date: nil, week_day: 4, start_time: nil, end_time: nil, open: true},
  {pro_id: 1, date: nil, week_day: 5, start_time: nil, end_time: nil, open: true},
  {pro_id: 1, date: nil, week_day: 6, start_time: nil, end_time: nil, open: true}
])
Conversation.create!([
  {booking_id: 1},
  {booking_id: 2},
  {booking_id: 3}
])
Message.create!([
  {sender_type: "User", sender_id: 1, conversation_id: 2, body: "hello", read: false}
])

Participant.create!([
  {person_type: "User", person_id: 1, conversation_id: 1},
  {person_type: "Pro", person_id: 1, conversation_id: 1},
  {person_type: "User", person_id: 1, conversation_id: 2},
  {person_type: "Pro", person_id: 1, conversation_id: 2},
  {person_type: "User", person_id: 1, conversation_id: 3},
  {person_type: "Pro", person_id: 1, conversation_id: 3}
])
