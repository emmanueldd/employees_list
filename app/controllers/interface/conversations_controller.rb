module Interface
  class ConversationsController < InterfaceController
    before_action :set_conversation, only: [:show]

    def index
      @conversations = current_user.conversations
    end

    def show
      @messages = @conversation.messages
      @message = Message.new()
      @booking = @conversation.booking
    end

    def create
      @mission = Mission.find(params[:mission_id])
      @pro = @mission.pro
      if @conversation = conversation_exists(current_user, @pro)
        # if @mission != @conversation.mission
        redirect_to @conversation
      else
        # @conversation = Conversation.new(sender: current_user, recipient: @pro)

        @mission = Mission.find(params[:mission_id])
        @pro = @mission.pro
        @booking = Booking.create!(mission: @mission, user: current_user, pro: @pro)
        @conversation = Conversation.create(booking: @booking)
        @participant = @conversation.participants.create(person: current_user)
        @participant = @conversation.participants.create(person: @pro)
        redirect_to [:interface, @conversation]
      end
    end

    def conversation_exists(user, pro)
      false
    end

    private
      def set_conversation
        @conversation = current_user.conversations.find_by_id(params[:id])
      end

      def conversation_params

      end

  end
end
