class Post < ApplicationRecord
    include Rails.application.routes.url_helpers

    has_one_attached :image
  
    belongs_to :user
    # has_many :likes, dependent: :destroy
    # has_many :likers, through: :likes, source: :user
  
    validates :image, {
      presence: true
    }
    
    def get_image_url
      url_for(self.image)
    end
  
  end