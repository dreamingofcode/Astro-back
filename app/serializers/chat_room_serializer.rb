class ChatRoomSerializer < ActiveModel::Serializer
    attributes :id,:user1_id,:user2_id,:name
    # has_many :user_one_messages
    # has_many :user_two_messages
  end
  