class User < ApplicationRecord
    has_secure_password
    has_many :chat_rooms,:through=> :user_one_chatrooms
    has_many :chat_rooms,:through=> :user_two_chatrooms
    has_many :user_one_chatrooms, :class_name => 'ChatRoom', :foreign_key => "user1_id"
    has_many :user_two_chatrooms, :class_name => 'ChatRoom', :foreign_key => "user2_id"
    has_many :posts
    # has_many :messages, through: :chat_rooms,dependent: :destroy
    
    validates :email,:name,uniqueness:{case_sensitive:false}
end
