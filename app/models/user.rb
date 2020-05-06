class User < ApplicationRecord
    has_secure_password
    # has_many :chat_rooms, :foreign_key=> "user1_id"
    has_many :user_one_chatrooms, :class_name => 'ChatRoom', :foreign_key => "user1_id"
    has_many :user_two_chatrooms, :class_name => 'ChatRoom', :foreign_key => "user2_id"
    has_many :messages, through: :chat_rooms,dependent: :destroy
    has_many :posts

    validates :email,:name,uniqueness:{case_sensitive:false}
    # validates :age,:numericality => { greater_than_or_equal_to: 18, less_than: 60 }
    # post "/auth", to: 'auth#create'



end
