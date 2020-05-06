class ChatRoomSerializer < ActiveModel::Serializer
    attributes :id,:user1_id,:user2_id,:name
  end
  # has_many :user_one_messages
  # has_many :user_two_messages
  