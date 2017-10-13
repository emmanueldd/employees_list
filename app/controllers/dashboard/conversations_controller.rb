module Dashboard
  class ConversationsController < DashboardController
    before_action :set_conversation, only: [:show, :create]

    def index
      @conversations = current_pro.conversations
    end

    def show
      @messages = @conversation.messages
      @message = Message.new()
    end

    def create
      @conversation = Conversation.new(conversation_params)
    end

    private
      def set_conversation
        @conversation = current_pro.conversations.find_by_id(params[:id])
      end

      def conversation_params

      end

  end
end
