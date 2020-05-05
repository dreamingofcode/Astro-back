class PostsController < ApplicationController
    def index
        posts= Post.all 
        render json: posts
    end
    def create
        @user = User.find_by(id: params[:user_id])
        puts @user
         if  @user.posts.length >= 3
            render json: {errors: "You have exceeded the amount of image uploads permitted!"}
         else 
            @post = Post.create(post_params())
            respond_to_post()
         end
      end

      def show
        @post= Post.find_by(user_id: params[:id])
        if @post
        @user = User.find_by(id: params[:user_id])
        render json: @post
        # respond_to_post()
        else 
            render json:{error:"User Does not have uploaded image"}
        end
    end

    def show2
    @post=Post.find_by(id: params[:id])
    @user= User.find_by(id: @post.user_id)
    respond_to_post()
    end

    def update
        @post= Post.find(params[:id])
        if @post.update(post_params_update)
            render json:@post
        else
            render json: {error: 'Failed to UPDATE post, check credentials and try again!'}, status: :not_acceptable
        end
      end

    def destroy
        post=Post.find(params[:id])
        post.destroy
        render json: post
      end
    
      private def post_params_update
        params.require(:post).permit(:user_id, :caption, :image,:image_url)
      end

      private def post_params
        params.permit(:user_id, :caption, :image,:image_url=>"")
      end
    
      private def respond_to_post()
        if @post.valid?()
           puts @post
          post_serializer = PostSerializer.new(post: @post, user: @user)
          render json: post_serializer.serialize_new_post()
        else
          render json: { errors: @post.errors }, status: 400
        end
      end
      
    end
    
