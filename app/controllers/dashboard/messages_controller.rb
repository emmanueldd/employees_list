module Dashboard
  class MessagesController < DashboardController

    before_action :set_conversation, only: [:create]

    def create
      @message = @conversation.messages.new(message_params)
      @message.sender = current_resource
      if @message.save
        redirect_back(fallback_location: root_path)
      end
    end

    private
      def set_conversation
        @conversation = Conversation.find_by_id(params[:conversation_id])
      end

      def message_params
        params.require(:message).permit(:body)
      end
  end
end
