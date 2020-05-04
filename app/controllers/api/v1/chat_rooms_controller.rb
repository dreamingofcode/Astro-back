class Api::V1::ChatRoomsController < ApplicationController
    def index 
        chatrooms= ChatRoom.all 
        render json: chatrooms
    end

    def create
        chatroom= ChatRoom.find_or_create_by(chatroom_params)
        if chatroom.valid?
            render json: { chatroom: ChatRoomSerializer.new(chatroom)},status: :created
        else
            render json: {error: 'Failed to create chatroom, check credentials and try again!'}, status: :not_acceptable
        end
    end

    def show
        chatroom= ChatRoom.where(user1_id: params[:id])
        chatroom1= ChatRoom.where(user2_id: params[:id])
        if chatroom
            render json: chatroom
  
        
        elsif chatroom1 
            render json: chatroom
  
           else
            render json: {error: 'wrong!'}, status: 401
           end
    end

    def destroy
        chatroom=ChatRoom.find(params[:id])
        chatroom.destroy
        render json: chatroom
      end
    

end
private
def chatroom_params
    params.require(:chatroom).permit(:user1_id,:user2_id,:name)

end
