class MessageSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :recipient_id, :text, :chatroom_name,:chatroom_id, :read,:created_at
end
