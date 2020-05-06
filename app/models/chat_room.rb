class ChatRoom < ApplicationRecord
    # belongs_to :users
    belongs_to :user1, :class_name => "User"
    belongs_to :user2, :class_name => "User"
    has_many :user_one_messages, :class_name=> 'Message', :foreign_key=> "user_id",dependent: :destroy
    has_many :user_two_messages, :class_name=> 'Message', :foreign_key=> "recipient_id",dependent: :destroy

end