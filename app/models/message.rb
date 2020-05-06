class Message < ApplicationRecord
    belongs_to :chat_room, :class_name=>"ChatRoom"
    belongs_to :user
    validates_length_of :text,  maximum: 210
end

