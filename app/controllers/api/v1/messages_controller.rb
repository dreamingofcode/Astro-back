class Api::V1::MessagesController < ApplicationController
    def index 
        messages= Message.all 
        render json: messages
    end

    def create
        message= Message.create(message_params)
        if message.valid?
            render json: { message: MessageSerializer.new(message)},status: :created
        else
            render json: {error: 'Failed to create message, check credentials and try again!'}, status: :not_acceptable
        end
    end

    def show
        message= Message.where(chatroom_id: params[:id])

        if message
            render json: message
  
           else
            render json: {error: 'wrong!'}, status: 401
           end
    end

    def destroy
        message=Message.find(params[:id])
        message.destroy
        render json: message
      end
    

end
private
def message_params
    params.require(:message).permit(:user_id, :recipient_id, :text, :chatroom_name,:chatroom_id, :read)

end
