class UserSerializer < ActiveModel::Serializer
    attributes :id,:name,:email,:password,:bio,:birthDate,:gender,:sexualOrientation,:zodiac,:age,:profile_image
  # has_many :chat_rooms
     has_many :user_one_chatrooms
       has_many :user_two_chatrooms
       has_many :posts
       
  end
  