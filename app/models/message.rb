class Message < ApplicationRecord
    belongs_to :chatroom, :class_name=>"ChatRoom"
    belongs_to :user
    validates_length_of :text,  maximum: 210
end

