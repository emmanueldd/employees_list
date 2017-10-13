module ConversationsHelper
  def last_message(conversation)
    recipient = conversation.participants.find { |p| p != current_resource }.person
    conversation.last_message.present? ? conversation.last_message.body : "New message to #{recipient.first_name}"
  end
end
