class PostSerializer 
  # < ActiveModel::Serializer
  
  # attributes :id
  def initialize(post: nil, user:)
    @post = post
    @user = user
  end

  def serialize_new_post()
    user_details = serialize_user_details()
  
    serialized_new_post = serialize_post(@post)
    # .merge(user_details)
    serialized_new_post.to_json()
  end
  
  private def serialize_post(post)
    {
      post: {
        id: post.id,
        image_url: post.get_image_url(),
        caption: post.caption,
        # most_recent_likes: post.get_most_recent_likes(),
        # like_count: post.likes.length,
        created_at: post.created_at,
        # liked_by_current_user: post.liked_by?(@user),
        # author: {
        #   id: post.user.id,
        #   username: post.user.username,
        #   followed_by_current_user: post.user.followed_by?(@user)
        # }
      }
    }
  end
  
  private def serialize_user_details
  end
  
end